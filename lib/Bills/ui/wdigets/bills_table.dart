import 'package:flutter/material.dart';
import 'package:nextline/Bills/model/model_bill_detail.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class BillsTable extends StatelessWidget {
  final List<BillDetail> data;

  const BillsTable({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 40),
      child: Table(
        border: TableBorder(
          verticalInside: BorderSide(
              width: 1,
              color: AppColors.gray_shadow_color,
              style: BorderStyle.solid),
          horizontalInside: BorderSide(
              width: 1,
              color: AppColors.gray_shadow_color,
              style: BorderStyle.solid),
        ),
        columnWidths: {0: FractionColumnWidth(0.3)},
        children: [
          TableRow(children: [
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Decripción",
                  style: TextStyle(
                      fontFamily: AppFonts.poppins_regular,
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Bs.",
                  style: TextStyle(
                      fontFamily: AppFonts.poppins_regular,
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "USD",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppFonts.poppins_regular,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ]),

          ...data.map((e) =>  _billRow(e.concepto, e.total, e.total_bs))
        ],
      ),
    );
  }

  TableRow _billRow(description, total, total_bs) {
    return TableRow(children: [
      TableCell(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(
            description,
            style: TextStyle(
              color: AppColors.gray_text_color,
              fontSize: 14,
              fontFamily: AppFonts.poppins_regular,
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Center(
            child: Text(
              total + ' USD',
              style: TextStyle(
                color: AppColors.gray_text_color,
                fontSize: 14,
                fontFamily: AppFonts.poppins_regular,
              ),
            ),
          ),
        ),
      ),
      TableCell(
        child: Container(
          margin: EdgeInsets.all(10),
          child: Text(
            total_bs,
            style: TextStyle(
              color: AppColors.gray_text_color,
              fontSize: 14,
              fontFamily: AppFonts.poppins_regular,
            ),
          ),
        ),
      ),
    ]);
  }
}
