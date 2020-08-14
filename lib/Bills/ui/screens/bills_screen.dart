import 'package:flutter/material.dart';
import 'package:nextline/BillDetails/ui/wdigets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';

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
                  style: TextStyle(color: AppColors.blue, fontSize: 16),
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
          borderRadius: BorderRadius.circular(10),
          color: Colors.white70,
          boxShadow: [
            BoxShadow(
              color: AppColors.gray_shadow_color,
              blurRadius: 20,
              spreadRadius: 6,
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
                Text(
                  "Factura ${bill_id}",
                  style: TextStyle(color: AppColors.blue),
                ),
                Text(bill_date),
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
                ColoredLabel(text: bill_status),
                Text("\$${bill_dolar_price} / Bs. ${bill_bolivar_price}"),
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



