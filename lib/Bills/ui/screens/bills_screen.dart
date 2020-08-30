import 'package:flutter/material.dart';
import 'package:nextline/Bills/bloc/bloc_bills.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
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
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 27),
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
                          if (snapshot.connectionState == ConnectionState.done)
                            return ListView(
                              scrollDirection: Axis.vertical,
                              children: snapshot.data
                                  .map<Widget>((Bill bill) => _billRow(bill))
                                  .toList(),
                            );
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  height: 25,
                                  width: 25,
                                  child: CircularProgressIndicator()),
                            ],
                          );
                        }),
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

  Widget _billRow(Bill bill) {
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
            date: "\$${bill.total}",
            id: "Factura #${bill.id}",
            status: bill.mapToBillStatusString(bill.status),
            label: bill.fechaEmision,
            reverseLeft: true,
          )),
    );
  }

  void _showDetails() {
    Navigator.pushNamed(context, '/bill-details');
  }
}
