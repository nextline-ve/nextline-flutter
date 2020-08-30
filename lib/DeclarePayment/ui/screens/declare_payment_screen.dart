import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/Bills/ui/screens/bill_sent.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/line.dart';
import 'package:nextline/widgets/upload_image_modal.dart';

class DeclarePaymentScreen extends StatefulWidget {
  final picker = ImagePicker();
  final bool dollar;

  DeclarePaymentScreen({Key key, this.dollar = true}) : super(key: key);

  @override
  _DeclarePaymentScreenState createState() => _DeclarePaymentScreenState();
}

class _DeclarePaymentScreenState extends State<DeclarePaymentScreen> {
  _DeclarePaymentScreenState({this.imageFile}) : super();

  int method;
  File imageFile;
  String _nroReferencia = "";
  String _fecha = "";
  String _monto = "";

  void getImage(ImageSource source) {
    widget.picker.getImage(source: source).then((pickedFile) => setState(() {
          imageFile = File(pickedFile.path);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        title: Text(
          'FACTURACIÓN',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
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
                          options: [
                            new DropdownItemType(
                                id: 1,
                                descripcion: "Zelle",
                                image: "assets/images/zelle.png"),
                            new DropdownItemType(
                                id: 2,
                                descripcion: "Bank of America",
                                image: "assets/images/bofa.png"),
                            new DropdownItemType(
                                id: 3,
                                descripcion: "Banesco Panamá",
                                image: "assets/images/banesco.png"),
                            new DropdownItemType(
                                id: 4,
                                descripcion: "PayPal",
                                image: "assets/images/paypal.png"),
                          ],
                          value: method != null ? method.toString() : null,
                          onChanged: (val) => {
                            setState(() {
                              method = int.parse(val);
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
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 16),
                              child: Text(
                                "pagos@nextline.com",
                                style: TextStyle(
                                    fontFamily: AppFonts.poppins_regular,
                                    color: AppColors.blue_dark,
                                    fontSize: 16),
                              ),
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
                    background: AppColors.green_color,
                    onTab: () {
                      if (_isValid())
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BillSent()));
                    },
                  ),
                ],
              ),
            ),
          )
        ], // <Widget>[]
      ),
      endDrawer: LateralMenu(),
    );
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
            child: JTextField(
              top: 0.0,
              label: "FECHA",
              isPass: false,
              inputType: TextInputType.text,
              borderColor: AppColors.blue,
              onKeyValue: (value) => _fecha = value,
            ),
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
    return method != null &&
        imageFile != null &&
        _nroReferencia != "" &&
        _fecha != "" &&
        _monto != "";
  }
}
