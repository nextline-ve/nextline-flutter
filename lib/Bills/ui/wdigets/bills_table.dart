import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class BillsTable extends StatelessWidget {
  final List data;

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
        columnWidths: {0: FractionColumnWidth(0.5)},
        children: [
          TableRow(children: [
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Decripcion",
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
                  "Total Dolar",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppFonts.poppins_regular,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
            TableCell(
              child: Container(
                margin: EdgeInsets.all(10),
                child: Text(
                  "Total Bs.",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: AppFonts.poppins_regular,
                      fontSize: 10,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ]),
          _BillRow("Item #9", "80", "123.123.123"),
          _BillRow("Item #1", "10", "79.123.123"),
        ],
      ),
    );
  }

  TableRow _BillRow(description, dolar_price, bolivar_price){
    return TableRow(
      children: [
        TableCell(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(description, style: TextStyle( color: AppColors.gray_text_color, fontSize: 14, fontFamily: AppFonts.poppins_regular,),),
          ),
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Center(
              child: Text(dolar_price, style: TextStyle( color: AppColors.gray_text_color, fontSize: 14, fontFamily: AppFonts.poppins_regular,),),
            ),
          ),
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text(bolivar_price, style: TextStyle( color: AppColors.gray_text_color, fontSize: 14, fontFamily: AppFonts.poppins_regular, ),),
          ),
        ),
      ]
    );
  }
}
