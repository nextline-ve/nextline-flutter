import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nextline/Bills/bloc/bloc_bills.dart';
import 'package:nextline/Bills/model/model_bill.dart';
import 'package:nextline/Bills/model/model_currency.dart';
import 'package:nextline/Bills/ui/wdigets/bills_table.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/DeclarePayment/ui/screens/declare_payment_screen.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/utils/app_utils.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';
import 'package:url_launcher/url_launcher.dart';

class BillDetailsScreen extends StatefulWidget {
  final Bill bill;
  final BlocBills blocBills;

  BillDetailsScreen({Key key, @required this.bill, @required this.blocBills})
      : super(key: key);

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
                        label: "Factura",
                        id: "#${widget.bill.id}",
                        status: "${widget.bill.getStatusDisplay}",
                        date: AppUtils.formatDate(widget.bill.fechaEmision)),
                    BillsTable(data: widget.bill.facturaDetalleSet),
                    _billResume(),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: (widget.bill.status != BillStatus.G && widget.bill.status != BillStatus.V) ? MainAxisAlignment.center : MainAxisAlignment.spaceEvenly,
                      children: [
                        _billFooter(),
                        (widget.bill.status != BillStatus.G && widget.bill.status != BillStatus.V) ? Container() : _billCompromiso()
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigatorBar(index: 0),
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
              "Total a pagar\n${widget.bill.total} USD",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 21,
                fontFamily: AppFonts.poppins_regular,
              ),
            ),
          ),
        ),
        Container(
          child: FutureBuilder<List<CurrencyModel>>(
              future: widget.blocBills.getDataCurrencies(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  var data = snapshot.data;
                  return Table(
                    border: TableBorder(
                      verticalInside: BorderSide(
                          width: 1,
                          color: AppColors.gray_shadow_color,
                          style: BorderStyle.solid),
                    ),
                    columnWidths: {
                      0: FractionColumnWidth(1 / snapshot.data.length)
                    },
                    children: [
                      (widget.bill.status != BillStatus.G && widget.bill.status != BillStatus.V) ? getTableRowNone() : TableRow(
                          children: data
                              .map(
                                (currency) =>
                                    _tableHead("Total en ${currency.moneda}"),
                              )
                              .toList()),
                      (widget.bill.status != BillStatus.G && widget.bill.status != BillStatus.V) ? getTableRowNone() : TableRow(
                        children: data
                            .map((currency) => TableCell(
                          child: Container(
                            margin: EdgeInsets.all(10),
                            child: Center(
                              child: Text(
                                widget.bill.getTotal(currency.simbolo, widget.bill),
                                style: TextStyle(
                                  color: AppColors.ligth_blue_color,
                                  fontSize: 14,
                                  fontFamily: AppFonts.poppins_regular,
                                ),
                              ),
                            ),
                          ),
                        )).toList(),
                      ),
                      (widget.bill.status != BillStatus.G && widget.bill.status != BillStatus.V) ? getTableRowNone() : TableRow(
                        children: data
                            .map((currency) => TableCell(
                                  child: Container(
                                    child: Center(
                                      child: JButton(
                                        fontSize: 10,
                                        label: "Pagar en\n${currency.moneda}",
                                        labelColor: AppColors.blue_dark,
                                        buttonHeight: 50.0,
                                        minWidth: 600,
                                        padding: EdgeInsets.all(10),
                                        borderColor: AppColors.blue_dark,
                                        onTab: () => Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DeclarePaymentScreen(
                                                      blocBills:
                                                          widget.blocBills,
                                                      currency: currency,
                                                    ))),
                                        background: Colors.white,
                                      ),
                                    ),
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  );
                }
                return JLoadingScreen();
              }),
        ),
      ],
    );
  }

  TableRow getTableRowNone() {
    return TableRow(
      children: [
        TableCell(
          child: Text(''),
        ),
        TableCell(
          child: Text(''),
        )
      ],
    );
  }

  TableCell _tableHead(title) {
    return TableCell(
      child: Container(
        alignment: Alignment.center,
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

  Widget _billFooter() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: _downloadBillAction,
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
      ),
    );
  }

  Widget _billCompromiso() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: _compromisoBillAction,
        child: Column(
          children: [
            Center(
              child: Text("COMPROMISO DE PAGO",
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 10,
                    fontFamily: AppFonts.poppins_regular,
                  )),
            ),
            _compromisoBill(),
          ],
        ),
      ),
    );
  }

  Widget _downloadBill() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Center(
        child: SvgPicture.asset(
          "assets/images/icon_download.svg",
          color: AppColors.blue_dark,
          height: 23,
        ),
      ),
    );
  }

  Widget _compromisoBill() {
    return Container(
      margin: EdgeInsets.only(top: 14),
      child: Center(
        child: SvgPicture.asset(
          "assets/images/icon_download.svg",
          color: AppColors.blue_dark,
          height: 23,
        ),
      ),
    );
  }

  void _downloadBillAction() async {
    var url =
        'https://nextline.jaspesoft.com/api/v1/admon/factura/pdf/${widget.bill.id}/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _compromisoBillAction() async {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
        locale: Locale.fromSubtags(languageCode: "en"),
        helpText: "Seleccione una fecha de compromiso",
        cancelText: "Cancelar",
        confirmText: "Confirmar",
        fieldHintText: "Intruzca una fecha");
  }
}
