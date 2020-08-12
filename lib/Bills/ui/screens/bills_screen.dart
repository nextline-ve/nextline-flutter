import 'package:flutter/material.dart';
import 'package:nextline/widgets/jbutton.dart';

class BillsScreen extends StatefulWidget {
  @override
  _BillsScreen createState() => _BillsScreen();
}

class _BillsScreen extends State<BillsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         backgroundColor: Color.fromRGBO(0, 109, 186, 1),
      ),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("LISTADO DE FACTURAS")
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 64),
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(left: 24),
                      child: Column(
                        children: [
                          Text("1 sqs s") ,
                          Text("12/12/23") ,
                        ],
                      )
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text(" 2 poiu"),
                          Text("23\$"),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          )

        ],
      ),
      
    );
  }
}