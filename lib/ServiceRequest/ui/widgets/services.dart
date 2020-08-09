import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Services extends StatefulWidget {
  final int id;
  final String name;

  const Services({Key key, @required this.id, this.name}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _Services();
  }
}

class _Services extends State<Services> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 18, bottom: 18, left: 20, right: 20),
      margin: EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        border: Border.all(width: 2.0, color: Color.fromRGBO(82, 192, 242, 1)),
        borderRadius: BorderRadius.circular(22), color: Colors.white),
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/select-internet-plan');
        },
        child: Row(
          children: [
            Expanded(
              flex: 8,
              child: Text(
                widget.name,
                style: TextStyle(
                    fontFamily: "fontSubTitle",
                    fontSize: 20,
                    color: Color.fromRGBO(0, 109, 186, 1)),
              ),
            ),
            Expanded(
                flex: 4,
                child: SvgPicture.asset("assets/images/${widget.name.toLowerCase()}.svg",
                    color: Color.fromRGBO(0, 109, 186, 1))
            )
          ],
        ),
      ),
    );
  }
}
