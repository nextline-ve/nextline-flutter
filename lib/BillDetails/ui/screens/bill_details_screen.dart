import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/widgets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';

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
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("Item #2", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
          ),
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("20", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
          ),
        ),
        TableCell(
          child: Container(
            margin: EdgeInsets.all(10),
            child: Text("123.000.123", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14 ),),
          ),
        ),
      ]
    );

    var myTableRow2 = TableRow(
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
                          ColoredLabel(text: "32 poiu 123"),
                          Container(
                            padding: EdgeInsets.fromLTRB(0,7,0,0),
                            child: Text("formated date"),
                          ),
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
                      myTableRow,
                      myTableRow2,
                    ],
                  ),
                ),
                _BillResume(),
                _BillFooter(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _BillResume() {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all( 30),
          child: Center(
            child: Text("Total a pagar", style: TextStyle(color: AppColors.blue, fontSize: 21),),
          ),
        ),
        Container(
          child: Table(
            border: TableBorder(
              verticalInside: BorderSide(width: 1, color: AppColors.gray_shadow_color, style: BorderStyle.solid),
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
                        child: Center(
                          child: Text("Total dolar", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Total Bs.", style: TextStyle( color: AppColors.gray_text_color, fontSize: 14),),
                        ),
                      ),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("\$50", style: TextStyle( color: AppColors.ligth_blue_color, fontSize: 14),),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Center(
                          child: Text("Bs. 50.000.000", style: TextStyle( color: AppColors.ligth_blue_color, fontSize: 14),),
                        ),
                      ),
                    ),
                  ]
              ),
              TableRow(
                  children: [
                    TableCell(
                      child: Container(
                        child: Center(
                            child: JButton(
                              label: "Pagar en dolar",
                              labelColor: AppColors.blue_dark,
                              borderColor: AppColors.blue_dark,
//                              onTab: _serviceRequest,
                              top: 10,
                              background: AppColors.white_color,
                            ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Container(
                        child: Center(
                          child: JButton(
                            label: "Pagar en Bs",
                            labelColor: AppColors.blue_dark,
                            borderColor: AppColors.blue_dark,
//                              onTab: _serviceRequest,
                            top: 10,
                            background: AppColors.white_color,
                          ),
                        ),
                      ),
                    ),
                  ]
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _BillFooter(){
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Center(
            child: Text("DESCARGAR FACTURA", style: TextStyle(color: AppColors.blue, fontSize: 10)),
          ),
          Container(
            margin: EdgeInsets.only(top: 14),
            child: Center(
              child: Text("icon"),
            ),
          ),
        ],
      ),
    );
  }

}