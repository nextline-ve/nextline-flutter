import 'dart:convert';

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
    // TODO: implement build
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
                    blocHome.id_suario.add(AppSession.data.idUsuario);
                  }
                  if (snapshot.hasData) {
                    Map<String, dynamic> data = snapshot.data;
                    print(data['contratos'][0]);

                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        HUserInformation(userName: AppSession.data.nombre),
                        HServiceType(
                            title: data['contratos'][0]["plan"]["tipo_servicio"]
                                ["servicio"]),
                        HCirclePlan(
                            planName: data['contratos'][0]['plan']['plan']),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 100, vertical: 10),
                          child: SpeedContainer(
                            uploadSpeed:
                                "${data['contratos'][0]["plan"]["velocidad_subida"].toString()} MB",
                            downloadSpeed:
                                "${data['contratos'][0]["plan"]["velocidad_baja"].toString()} MB",
                          ),
                        ),
                        !AppSession.data.esCliente
                            ? HStatusService(status: "En Analisis")
                            : HStatusRecipe(
                                precio_bs:data['contratos'][0]['plan']['precio_bs'],
                                precio_usb: data['contratos'][0]['plan']['precio'],
                                dia_corte: data['contratos'][0]['plan']['dia_corte'],
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
