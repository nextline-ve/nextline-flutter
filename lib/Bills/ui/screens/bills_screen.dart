import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class BillsScreen extends StatefulWidget {
  @override
  _BillsScreen createState() => _BillsScreen();
}

class _BillsScreen extends State<BillsScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "LISTADO DE FACTURAS",
                  style: TextStyle(color: AppColors.blue, fontSize: 16, fontFamily: AppFonts.fontTitle),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 27),
                ),
                Container(
                  child: Expanded(
                    child: ListView(
                      children: [
                        _BillRow(123123, "2000-12-12", 12, 12321, "Ok"),
                        _BillRow(67823123, "2000-12-12", 22,87, "Fail")],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _BillRow(bill_id, bill_date, bill_dolar_price, bill_bolivar_price, bill_status) {
    return InkWell(
      onTap: _showDetails,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray_shadow_color,
              blurRadius: 20,
              spreadRadius: 10,
            )
          ]
        ),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 7),
                  child: Text(
                    "Factura #${bill_id}",
                    style: TextStyle(color: AppColors.blue, fontFamily:  AppFonts.fontTitle ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text(bill_date, style: TextStyle(fontFamily:  AppFonts.fontTitle )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              textDirection: TextDirection.ltr,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 7),
                  child: ColoredLabel(text: bill_status),
                ),
                Container(
                  margin: EdgeInsets.only(top: 7),
                  child: Text("\$${bill_dolar_price} / Bs. ${bill_bolivar_price}", style: TextStyle(fontFamily:  AppFonts.fontTitle),),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }

  void _showDetails() {
    Navigator.pushNamed(context, '/bill-details');
  }
}



