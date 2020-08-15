import 'package:flutter/material.dart';
import 'package:nextline/Tickets/ui/widgets/dropdown.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class DeclarePaymentScreen extends StatefulWidget {
  @override
  _DeclarePaymentScreenState createState() => _DeclarePaymentScreenState();
}

class _DeclarePaymentScreenState extends State<DeclarePaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( backgroundColor: Color.fromRGBO(0, 109, 186, 1),),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 15) ,
                  child: Text(
                    "Declarar Pago",
                    style: TextStyle(color: AppColors.blue, fontSize: 21, fontFamily: AppFonts.fontTitle),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 27),
                ),
                Container(
//                  margin: EdgeInsets.only(to),
                  child: Expanded(
                    child: DropdownWidget(hintText: "hola")
                  ),
                ),
                Container(
                  child: Expanded(
                    child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(),
        ],
      ),
    );
  }
}