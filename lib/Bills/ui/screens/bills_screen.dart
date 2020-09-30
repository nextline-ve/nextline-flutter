import 'package:flutter/material.dart';
import 'package:nextline/Bills/bloc/bloc_bills.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/ui/screens/bill_details_screen.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_utils.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class BillsScreen extends StatefulWidget {
  @override
  _BillsScreen createState() => _BillsScreen();
}

class _BillsScreen extends State<BillsScreen> {
  BlocBills blocBills = BlocBills();
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
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "LISTADO DE FACTURAS",
                style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 16,
                    fontFamily: AppFonts.poppins_regular),
              ),
            ),
            Container(
              child: Expanded(
                child: FutureBuilder(
                    future: blocBills.getDataBills(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.data != null &&
                          snapshot.data.length > 0)
                        return ListView(
                          scrollDirection: Axis.vertical,
                          children: snapshot.data.map<Widget>((Bill bill) {
                            final int index = snapshot.data.indexOf(bill);
                            return _billRow(bill, index);
                          }).toList(),
                        );
                      if (snapshot.error == "Error de Cliente" ||
                          (snapshot.data != null &&
                              snapshot.data.length == 0)) {
                        return Center(
                          child: Text(
                            "Usted no tiene facturas en este momento",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: AppColors.blue_dark,
                                fontSize: 16,
                                fontFamily: AppFonts.poppins_bold),
                          ),
                        );
                      }
                      return JLoadingScreen();
                    }),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: NavigatorBar(index: 0),
      endDrawer: LateralMenu(),
    );
  }

  Widget _billRow(Bill bill, int index) {
    return InkWell(
      onTap: () => _showDetails(bill),
      child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          margin: EdgeInsets.only(bottom: 10),
          color: index % 2 == 0
              ? Colors.white
              : AppColors.light_blue.withOpacity(0.95),
          alignment: Alignment.center,
          child: ItemDetailHeader(
            date: "\$${bill.total}",
            id: "Factura #${bill.id}",
            status: bill.getStatusDisplay,
            label: AppUtils.formatDate(bill.fechaEmision),
            reverseLeft: true,
          )),
    );
  }

  void _showDetails(Bill bill) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BillDetailsScreen(
                  bill: bill,
                  blocBills: blocBills,
                )));
  }
}
