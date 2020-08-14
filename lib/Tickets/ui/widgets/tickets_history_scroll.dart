import 'package:flutter/cupertino.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class TicketHistoryScroll extends StatefulWidget {
  TicketHistoryScroll({Key key}) : super(key: key);

  @override
  _TicketHistoryScrollState createState() => _TicketHistoryScrollState();
}

class _TicketHistoryScrollState extends State<TicketHistoryScroll> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 52),
      child: Column(
        children: [_titleText("Histórico de tickets")],
      ),
    );
  }
}

Widget _titleText(String status) {
  return Text(status.toUpperCase(),
      style: TextStyle(
          fontFamily: AppFonts.poppins_regular,
          fontSize: 18,
          color: AppColors.blue_dark));
}
