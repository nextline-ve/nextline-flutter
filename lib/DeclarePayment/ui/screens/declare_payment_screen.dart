import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/Tickets/ui/widgets/input_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:nextline/widgets/line.dart';

class DeclarePaymentScreen extends StatefulWidget {
  @override
  _DeclarePaymentScreenState createState() => _DeclarePaymentScreenState();
}

class _DeclarePaymentScreenState extends State<DeclarePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        title: Text(
          'FACTURACION',
          style: TextStyle(fontFamily: AppFonts.input),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                top: 39,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "Declarar Pago",
                      style: TextStyle(
                          color: AppColors.blue,
                          fontSize: 19,
                          fontFamily: AppFonts.poppins_bold),
                    ),
                  ),
                  Column(
                    children: [
                      InputContainer(
                        input: DropdownWidget(hintText: "Medio de pago" ),
                        label: "",
                      ),
                      Center(
                        child: Column(
                          children: [
                            Container(
                              child: Text("Datos del Beneficiario", style: TextStyle(fontFamily: AppFonts.poppins_regular, fontSize: 13),),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0, 10, 0, 16),
                              child: Text("pagos@nextline.com", style: TextStyle(fontFamily: AppFonts.poppins_regular, color: AppColors.blue_dark, fontSize: 16),),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  _inputsForm(),
                  _fileNameDisplayer(),
                  JButton(
                    label: "FINALIZAR PAGO",
                    background: AppColors.green_color,
                    onTab: () => _finishPayment(),
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

  Column _inputsForm(){
    return Column(
      children: [
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JTextField(top: 0.0,label: "№ DE REFERENCIA", isPass: false, inputType: TextInputType.text, borderColor: AppColors.blue,),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JTextField(top: 0.0,label: "FECHA", isPass: false, inputType: TextInputType.text, borderColor: AppColors.blue),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JTextField(top: 0.0,label: "MONTO QUE PAGO", isPass: false, inputType: TextInputType.text, borderColor: AppColors.blue),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: EdgeInsets.only(left: 24, right: 24),
            child: JButton(
              icon: Icons.file_upload,
              fontSize: 10.0,
              label: "ADJUNTAR COMPROBANTE DE PAGO",
              background: AppColors.blue_dark,
              onTab: () => _uploadBill(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fileNameDisplayer(){
    print("_fileNameDisplayer");
    return Container(
      padding: EdgeInsets.fromLTRB(60, 0, 60, 0),
      child: Column(
        children: [
          VerticalLine(heigth: 1, color: AppColors.gray_shadow_color, width: 300,),
          Line(bottom: 5, top: 5,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("!myFile.pdf"),
                InkWell(
                  onTap: () => _deleteBill(),
                  child: Icon(
                    Icons.delete_forever,
                    color: AppColors.blue_dark,
                    size: 20,
                  ),
                ),
              ],
            ),
          ),
          Line(bottom: 5, top: 5,),
          VerticalLine(heigth: 1, color: AppColors.gray_shadow_color, width: 300,),
        ],
      ),
    );
  }

  _uploadBill(){
    print("_uploadBill");
  }

  _deleteBill(){
    print("_deleteBill");
  }

  _finishPayment(){
    print("_finishPayment");
  }

}
