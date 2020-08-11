import 'package:flutter/cupertino.dart';

class SpeedContainer extends StatefulWidget {
  final String download_speed;
  final String upload_speed;
  const SpeedContainer({
    Key key,
    @required this.download_speed,
    @required this.upload_speed,
  }) : super(key: key);

  @override
  _SpeedContainerState createState() => _SpeedContainerState();
}

class _SpeedContainerState extends State<SpeedContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
                    image: AssetImage("assets/images/down-arrow.png"),
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
    );
  }
}
