import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nextline/utils/app_colors.dart';

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
                child: SvgPicture.asset("assets/images/up-arrow.svg",
                    color: AppColors.green_color),
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
                child: SvgPicture.asset("assets/images/down-arrow.svg",
                    color: AppColors.green_color),
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
