import 'package:flutter/material.dart';
import 'package:nextline/Bills/bloc/bloc_bills.dart';
import 'package:nextline/Bills/model/model_currency.dart';
import 'package:nextline/DeclarePayment/ui/widgets/form_declare_payment.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/lateral_menu.dart';

class DeclarePaymentScreen extends StatefulWidget {
  final BlocBills blocBills;
  final CurrencyModel currency;
  final int invoiceId;

  DeclarePaymentScreen(
      {Key key,
      @required this.blocBills,
      @required this.currency,
      @required this.invoiceId})
      : super(key: key);

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
          'FACTURACIÓN',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
        centerTitle: true,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          FormDeclarePayment(
            blocBills: widget.blocBills,
            currency: widget.currency,
            invoiceId: widget.invoiceId,
          )
        ],
      ),
      endDrawer: LateralMenu(),
    );
  }
}
