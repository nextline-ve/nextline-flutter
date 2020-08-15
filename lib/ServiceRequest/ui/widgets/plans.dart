import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/speed_container.dart';
import 'package:nextline/widgets/jtitle.dart';

class Plans extends StatefulWidget {
  final int id;
  final String planName;
  final String downloadSpeed;
  final String uploadSpeed;
  final String priceUsd;
  final String priceBs;

  const Plans(
      {Key key,
      @required this.id,
      @required this.planName,
      @required this.downloadSpeed,
      @required this.uploadSpeed,
      @required this.priceUsd,
      @required this.priceBs})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _Plans();
  }
}

class _Plans extends State<Plans> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/personal-form');
      },
      child: Container(
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
                  JTitle(
                      title: widget.planName,
                      color: Color.fromRGBO(2, 144, 223, 1)),
                  SpeedContainer(
                    downloadSpeed: widget.downloadSpeed,
                    uploadSpeed: widget.uploadSpeed,
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 20),
                      child: Text("PRECIO MESUAL",
                          style: TextStyle(
                              fontFamily: "fontLight",
                              color: Color.fromRGBO(70, 69, 69, 0.4)))),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 20, right: 20),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(2, 144, 223, 1),
                        borderRadius: BorderRadius.circular(25)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Text(
                            widget.priceUsd,
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
                            widget.priceBs,
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
      ),
    );
  }
}
