import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

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
                  style: TextStyle(
                      color: AppColors.blue,
                      fontSize: 16,
                      fontFamily: AppFonts.fontTitle),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 27),
                ),
                Container(
                  child: Expanded(
                    child: ListView(
                      children: [
                        _billRow(123123, "2000-12-12", 12, 12321, "Ok"),
                        _billRow(67823123, "2000-12-12", 22, 87, "Fail")
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigatorBar(),
      endDrawer: LateralMenu(),
    );
  }

  Widget _billRow(double billId, String billDate, double billDolarPrice,
      double billBolivarPrice, String billStatus) {
    String date = "\$$billDolarPrice / Bs. $billBolivarPrice";
    String id = "Factura #$billId";

    return InkWell(
      onTap: _showDetails,
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
              ]),
          alignment: Alignment.center,
          child: ItemDetailHeader(
            date: date,
            id: id,
            status: billStatus,
            label: billDate,
            reverseLeft: true,
          )),
    );
  }

  void _showDetails() {
    Navigator.pushNamed(context, '/bill-details');
  }
}
