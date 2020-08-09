import 'package:flutter/material.dart';
import 'package:nextline/widgets/jtitle.dart';

class Plans extends StatefulWidget {
  final int id;
  final String plan_name;
  final String download_speed;
  final String upload_speed;
  final String price_usd;
  final String price_bs;

  const Plans(
      {Key key,
      @required this.id,
      @required this.plan_name,
      @required this.download_speed,
      @required this.upload_speed,
      @required this.price_usd,
      @required this.price_bs})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Plans();
  }
}

class _Plans extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 50, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 260,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              color: Colors.white,
              border: Border.all(
                  width: 2.0, color: Color.fromRGBO(82, 192, 242, 1)),
            ),
            child: Column(
              children: [
                JTitle(title: widget.plan_name, color: Color.fromRGBO(2, 144, 223, 1)),
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage("assets/images/up-arrow.png"),
                              ),
                            ),
                          ),
                          Text(widget.upload_speed,
                              style: TextStyle(
                                  fontFamily: "fontLight",
                                  fontSize: 18,
                                  color: Color.fromRGBO(70, 69, 69, 1)))
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Container(
                            height: 30,
                            width: 20,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image:
                                    AssetImage("assets/images/down-arrow.png"),
                              ),
                            ),
                          ),
                          Text(widget.download_speed,
                              style: TextStyle(
                                  fontFamily: "fontLight",
                                  fontSize: 18,
                                  color: Color.fromRGBO(70, 69, 69, 1)))
                        ],
                      ),
                    )
                  ]),
                ),
                Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Text("PRECIO MESUAL",
                        style: TextStyle(
                            fontFamily: "fontLight",
                            color: Color.fromRGBO(70, 69, 69, 0.4)))),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding:
                      EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(2, 144, 223, 1),
                      borderRadius: BorderRadius.circular(25)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Text(
                          widget.price_usd,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "fontSubTitle",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          "/",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: "fontSubTitle",
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 7,
                        child: Text(
                          widget.price_bs,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: "fontSubTitle",
                          ),
                        ),
                      )
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
