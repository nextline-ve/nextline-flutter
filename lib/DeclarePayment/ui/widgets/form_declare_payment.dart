import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/Bills/bloc/bloc_bills.dart';
import 'package:nextline/Bills/model/model_bank.dart';
import 'package:nextline/Bills/model/model_currency.dart';
import 'package:nextline/Bills/ui/screens/bill_sent.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_http.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/line.dart';
import 'package:nextline/widgets/upload_image_modal.dart';
import 'package:intl/intl.dart';

class FormDeclarePayment extends StatefulWidget {
  final picker = ImagePicker();
  final BlocBills blocBills;
  final CurrencyModel currency;

  FormDeclarePayment(
      {Key key, @required this.blocBills, @required this.currency})
      : super(key: key);

  @override
  _FormDeclarePayment createState() => _FormDeclarePayment();
}

class _FormDeclarePayment extends State<FormDeclarePayment> {
  List<BankModel> banks = [];
  int selectedBank;
  File imageFile;
  String _nroReferencia = "";
  String _fecha = "";
  String _monto = "";
  DateTime selectedDate;
  bool isShowDatePicker = true;
  final dateController = TextEditingController();
  final DateFormat formatter = DateFormat('dd-MM-yyyy');

  @override
  void initState() {
    super.initState();
    selectedDate = DateTime.now();
    dateController.text = formatter.format(selectedDate);
  }

  @override
  void dispose() {
    dateController.dispose();
    super.dispose();
  }

  void setDateInput(DateTime date) {
    setState(() {
      dateController.text = formatter.format(date);
    });
  }

  void getImage(ImageSource source) {
    widget.picker.getImage(source: source).then((pickedFile) => setState(() {
          imageFile = File(pickedFile.path);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<List<BankModel>>(
          future: widget.blocBills.getDataBanks(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done ||
                this.banks.length > 0) {
              if (this.banks.length == 0) this.banks = snapshot.data;
              if (snapshot.hasData) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          "Declarar Pago",
                          style: TextStyle(
                              color: AppColors.blue_dark,
                              fontSize: 19,
                              fontFamily: AppFonts.poppins_bold),
                        ),
                      ),
                      Column(
                        children: [
                          InputContainer(
                            input: DropdownWidget(
                              hintText: "Método de pago",
                              options: DropdownItemType.generateList(this
                                  .banks
                                  .where((bank) =>
                                      bank.tipoMoneda ==
                                      widget.currency.simbolo)
                                  .toList()),
                              value: selectedBank != null
                                  ? selectedBank.toString()
                                  : null,
                              onChanged: (val) => {
                                setState(() {
                                  selectedBank = int.parse(val);
                                })
                              },
                            ),
                            label: "",
                          ),
                          Center(
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "Datos del Beneficiario",
                                    style: TextStyle(
                                        fontFamily: AppFonts.poppins_regular,
                                        fontSize: 13),
                                  ),
                                ),
                                if (selectedBank != null)
                                  Container(
                                    margin: EdgeInsets.fromLTRB(0, 10, 0, 16),
                                    child: _bankDetails(this
                                        .banks
                                        .toList()
                                        .singleWhere(
                                            (bank) => bank.id == selectedBank)),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      _inputsForm(),
                      if (imageFile != null) _fileNameDisplayer(),
                      JButton(
                        label: "FINALIZAR PAGO",
                        background: _isValid()
                            ? AppColors.green_color
                            : AppColors.light_gray_color,
                        onTab: () {
                          if (_isValid()) {
                            AppHttp.requestIndicator(context);
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => BillSent()));
                          } else
                            Scaffold.of(context).showSnackBar(SnackBar(
                                content: Text(
                                    "Complete los datos solicitados para declarar su pago.")));
                        },
                      ),
                    ],
                  ),
                );
              }
              return Text(
                  "No hay datos para esta moneda. Por favor, escoja otra.");
            }
            return JLoadingScreen();
          }),
    );
  }

  Container _bankDetails(BankModel bank) {
    return Container(
        child: Column(children: [Text(bank.banco), Text(bank.numeroCuenta)]));
  }

  Column _inputsForm() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JTextField(
              top: 0.0,
              label: "N° DE REFERENCIA",
              isPass: false,
              inputType: TextInputType.text,
              borderColor: AppColors.blue,
              onKeyValue: (value) => _nroReferencia = value,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: _inputDatePayment(),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JTextField(
              top: 0.0,
              label: "MONTO QUE PAGO",
              isPass: false,
              inputType: TextInputType.text,
              borderColor: AppColors.blue,
              onKeyValue: (value) => _monto = value,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JButton(
              icon: Icons.file_upload,
              fontSize: 10.0,
              label: "ADJUNTAR COMPROBANTE",
              background: AppColors.blue_dark,
              onTab: () => showMyDialog(
                  context, "Seleccione su comprobante de pago", getImage),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fileNameDisplayer() {
    return Container(
      padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(
        children: [
          VerticalLine(
            heigth: 1,
            color: AppColors.gray_shadow_color,
            width: 300,
          ),
          Line(
            bottom: 5,
            top: 5,
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Imagen"),
                InkWell(
                  onTap: () => setState(() {
                    imageFile = null;
                  }),
                  child: Icon(
                    Icons.delete_forever,
                    color: AppColors.blue_dark,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Line(
            bottom: 5,
            top: 5,
          ),
          VerticalLine(
            heigth: 1,
            color: AppColors.gray_shadow_color,
            width: 300,
          ),
        ],
      ),
    );
  }

  bool _isValid() {
    return selectedBank != null &&
        imageFile != null &&
        _nroReferencia != "" &&
        _fecha != "" &&
        _monto != "";
  }

  void _showDatePicker() async {
    final date = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        locale: Locale.fromSubtags(languageCode: "en"),
        helpText: "Selecciona una fecha",
        cancelText: "Cancelar",
        confirmText: "Confirmar",
        fieldHintText: "Intruzca una fecha");

    if (date != null && date != selectedDate) {
      setDateInput(date);
    }
  }

  Widget _inputDatePayment() {
    return JTextField(
      top: 0.0,
      controller: dateController,
      label: "FECHA",
      isPass: false,
      inputType: TextInputType.text,
      borderColor: AppColors.blue,
      onKeyValue: (value) => _fecha = value,
      onTap: () => _showDatePicker(),
    );
  }
}
