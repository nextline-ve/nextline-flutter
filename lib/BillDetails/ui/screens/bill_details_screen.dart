import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/widgets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';

class BillDetails extends StatefulWidget {
  @override
  _BillDetailsState createState() => _BillDetailsState();
}

class _BillDetailsState extends State<BillDetails> {
  @override
  Widget build(BuildContext context) {

    var myTableRow =
      TableRow(
        children: [
          TableCell(
            child: Text("Item #2", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
          ),
          TableCell(
            child: Text("20", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
          ),
          TableCell(
            child: Text("123.000.123", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14 ),),
          ),
        ]
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Factura", style: TextStyle(color: AppColors.blue, fontSize: 21),),
                          Text("#56757567", style: TextStyle(color: AppColors.blue_dark, fontSize: 23),),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ColoredLabel(text: "2 poiu 123"),
                          Text("formated date"),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Table(
                    border: TableBorder(
                      verticalInside: BorderSide(width: 1, color: AppColors.gray_shadow_color, style: BorderStyle.solid),
                      horizontalInside: BorderSide(width: 1, color: AppColors.gray_shadow_color, style: BorderStyle.solid),
                    ),
                    columnWidths: {
                      0: FractionColumnWidth(0.5)
                    },
                    children: [
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Decripcion", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Total Dolar", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400),),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Total Bs.", style: TextStyle(color: Colors.black, fontSize: 10, fontWeight: FontWeight.w400 ),),
                            ),
                          ),
                        ]
                      ),
                      TableRow(
                        children: [
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("Item #1", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("10", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
                            ),
                          ),
                          TableCell(
                            child: Container(
                              margin: EdgeInsets.all(10),
                              child: Text("100.000.000", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14 ),),
                            ),
                          ),
                        ]
                      ),
//                      myTableRow
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}