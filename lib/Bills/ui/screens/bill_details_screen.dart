import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextline/Bills/ui/wdigets/bills_table.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/DeclarePayment/ui/screens/declare_payment_screen.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class BillDetailsScreen extends StatefulWidget {
  @override
  _BillDetailsScreen createState() => _BillDetailsScreen();
}

class _BillDetailsScreen extends State<BillDetailsScreen> {
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
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    ItemDetailHeader(
                        label: "My Invoice",
                        id: "#123",
                        status: "aproved",
                        date: "12/10/2020"),
                    BillsTable(data: []),
                    _billResume(),
                    _billFooter(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigatorBar(),
      endDrawer: LateralMenu(),
    );
  }

  Widget _billResume() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(30),
          child: Center(
            child: Text(
              "Total a pagar",
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 21,
                fontFamily: AppFonts.poppins_regular,
              ),
            ),
          ),
        ),
        Container(
          child: Table(
            border: TableBorder(
              verticalInside: BorderSide(
                  width: 1,
                  color: AppColors.gray_shadow_color,
                  style: BorderStyle.solid),
            ),
            columnWidths: {0: FractionColumnWidth(0.5)},
            children: [
              TableRow(children: [
                _tableHead("Total dolar"),
                _tableHead("Total Bs."),
              ]),
              TableRow(children: [
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: _totalToPayDollar("40"),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Center(
                      child: _totalToPayBs("50.000.000"),
                    ),
                  ),
                ),
              ]),
              TableRow(children: [
                TableCell(
                  child: Container(
                    child: Center(
                      child: JButton(
                        fontSize: 10,
                        label: "Pagar en Dólares",
                        labelColor: AppColors.blue_dark,
                        buttonHeight: 40.0,
                        borderColor: AppColors.blue_dark,
                        onTab: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeclarePaymentScreen())),
                        background: Colors.white,
                      ),
                    ),
                  ),
                ),
                TableCell(
                  child: Container(
                    child: Center(
                      child: JButton(
                        fontSize: 10,
                        label: "Pagar en Bs",
                        labelColor: AppColors.blue_dark,
                        buttonHeight: 40.0,
                        borderColor: AppColors.blue_dark,
                        onTab: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DeclarePaymentScreen(
                                      dollar: false,
                                    ))),
                        background: Colors.white,
                      ),
                    ),
                  ),
                ),
              ]),
            ],
          ),
        ),
      ],
    );
  }

  TableCell _tableHead(title) {
    return TableCell(
      child: Container(
        margin: EdgeInsets.all(10),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: AppColors.gray_text_color,
              fontSize: 14,
              fontFamily: AppFonts.poppins_regular,
            ),
          ),
        ),
      ),
    );
  }

  Text _totalToPayDollar(value) {
    return Text(
      "\$ $value",
      style: TextStyle(
        color: AppColors.ligth_blue_color,
        fontSize: 14,
        fontFamily: AppFonts.poppins_regular,
      ),
    );
  }

  Text _totalToPayBs(value) {
    return Text(
      "Bs. $value",
      style: TextStyle(
        color: AppColors.ligth_blue_color,
        fontSize: 14,
        fontFamily: AppFonts.poppins_regular,
      ),
    );
  }

  Widget _billFooter() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Center(
            child: Text("DESCARGAR FACTURA",
                style: TextStyle(
                  color: AppColors.blue,
                  fontSize: 10,
                  fontFamily: AppFonts.poppins_regular,
                )),
          ),
          _downloadBill(),
        ],
      ),
    );
  }

  Widget _downloadBill() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Center(
        child: InkWell(
          onTap: _downloadBillAction,
          child: SvgPicture.asset(
            "assets/images/icon_download.svg",
            color: AppColors.blue_dark,
            height: 23,
          ),
        ),
      ),
    );
  }

  void _downloadBillAction() {
    print("_downloadBill");
  }
}
