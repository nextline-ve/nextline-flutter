import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:nextline/Auth/bloc/bloc_auth.dart';
import 'package:nextline/Home/bloc/bloc_home.dart';
import 'package:nextline/Home/ui/widgets/center_circle.dart';
import 'package:nextline/Home/ui/widgets/service_text.dart';
import 'package:nextline/Home/ui/widgets/status_recipe.dart';
import 'package:nextline/Home/ui/widgets/status_service.dart';
import 'package:nextline/Home/ui/widgets/user_info.dart';
import 'package:nextline/ServiceRequest/ui/widgets/speed_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_session.dart';
import 'package:nextline/utils/firebase_fcm.dart';
import 'package:nextline/widgets/background.dart';
import 'package:nextline/widgets/jloading_screen.dart';
import 'package:nextline/widgets/lateral_menu.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }
}

class _HomeScreen extends State<HomeScreen> {
  BlocAuth blocAuth;
  BlocHome blocHome = BlocHome();


  @override
  Widget build(BuildContext context) {
    blocAuth = BlocProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Background(pathImage: "assets/images/fondo_home.png"),
          SingleChildScrollView(
            child: StreamBuilder(
                stream: blocHome.responseDataHome,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    FirebaseFCM().registerTokenFCM();
                    blocHome.idUsuario.add(AppSession.data.idUsuario);
                  }
                  if (snapshot.hasData) {
                    Map<String, dynamic> data = snapshot.data;

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HUserInformation(userName: AppSession.data.nombre),
                        HServiceType(
                            title: data['plan']["tipo_servicio"]["servicio"]),
                        HCirclePlan(
                            planName: data['plan']['plan']),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          child: SpeedContainer(
                            uploadSpeed:
                                "${data["plan"]["velocidad_subida"].toString()} Mb",
                            downloadSpeed:
                                "${data["plan"]["velocidad_baja"].toString()} Mb",
                          ),
                        ),
                        !AppSession.data.esCliente
                            ? HStatusService(status: data["status"])
                            : HStatusRecipe(
                                precioBs: data['plan']['precio_bs'],
                                precioUsb: data['plan']['precio'],
                                diaCorte: data['dia_corte'],
                              ),
                      ],
                    );
                  }

                  return JLoadingScreen();
                }),
          )
        ],
      ),
      bottomNavigationBar: NavigatorBar(),
      endDrawer: LateralMenu(),
    );
  }
}
