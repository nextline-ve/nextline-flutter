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
                Table(
                  children: [
                    
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}