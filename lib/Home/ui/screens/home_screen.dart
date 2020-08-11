import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/background_home.dart';
import 'package:nextline/Home/ui/widgets/center_circle.dart';
import 'package:nextline/Home/ui/widgets/label_text.dart';
import 'package:nextline/Home/ui/widgets/service_text.dart';
import 'package:nextline/Home/ui/widgets/status_recipe.dart';
import 'package:nextline/Home/ui/widgets/status_service.dart';
import 'package:nextline/Home/ui/widgets/user_info.dart';
import 'package:nextline/ServiceRequest/ui/widgets/speed_container.dart';

class HomeScreen extends StatefulWidget {
  final bool isClient;

  const HomeScreen({
    Key key,
    @required this.isClient,
  }) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          BackgroundHome(),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              HUserInformation(),
              HLabelText(title: "Tipo de Servicio"),
              HServiceTypeText(title: "Residencial"),
              HCirclePlan(),
              SpeedContainer(
                download_speed: "15Mb",
                upload_speed: "5MB",
              ),
              widget.isClient ? HStatusService() : HStatusRecipe()
            ],
          )
        ],
      ),
    );
  }

  void _serviceRequest() {
    Navigator.pushNamed(context, '/select-service');
  }
}
