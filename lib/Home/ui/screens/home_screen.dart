import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Home/ui/widgets/center_circle.dart';
import 'package:nextline/Home/ui/widgets/service_text.dart';
import 'package:nextline/Home/ui/widgets/status_recipe.dart';
import 'package:nextline/Home/ui/widgets/status_service.dart';
import 'package:nextline/Home/ui/widgets/user_info.dart';
import 'package:nextline/ServiceRequest/ui/widgets/speed_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class HomeScreen extends StatefulWidget {
  bool isClient;
  String userName;  

  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  BlocAuth blocAuth; 
  @override
  void initState() {
    super.initState();
    widget.userName = AppSession.data.nombre;
    widget.isClient = AppSession.data.esCliente;
  }

  @override
  Widget build(BuildContext context) {
    blocAuth = BlocProvider.of(context);
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(path_image: "assets/images/fondo_home.png"),
          SingleChildScrollView(
            child:
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  HUserInformation(
                    userName: widget.userName,
                  ),
                  HServiceType(title: "Residencial"),
                  HCirclePlan(),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 100, vertical: 10),
                    child: SpeedContainer(
                      download_speed: "15Mb",
                      upload_speed: "5MB",
                    ),
                  ),
                  !widget.isClient ? HStatusService() : HStatusRecipe(),
                ],
              ),
          )
        ],
      ),
      bottomNavigationBar: NavigatorBar(),
      endDrawer: LateralMenu(),
    );
  }
}
