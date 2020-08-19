import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/bloc/bloc_service_request.dart';
import 'package:nextline/ServiceRequest/model/model_plans.dart';
import 'package:nextline/ServiceRequest/ui/widgets/speed_container.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jbutton.dart';
import 'package:nextline/widgets/jtitle.dart';

class ConfirmChangePlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ConfirmChangePlan();
  }
}

class _ConfirmChangePlan extends State<ConfirmChangePlan> {
  BlocServiceRequest bloc = BlocServiceRequest();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'CAMBIO DE PLAN',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: StreamBuilder(
          stream: bloc.dataPlan,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              // print(snapshot.data.plan);
              return _confirmChangePlanUI(snapshot.data);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }

  Widget _confirmChangePlanUI(ModelPlans plan) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            "CONFIRMAR SOLICITUD",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontFamily: AppFonts.poppins_bold,
                fontSize: 16,
                color: AppColors.blue_dark),
          ),
          Container(
            margin: EdgeInsets.only(top: 40),
            child: Column(
              children: [
                Text(
                  "PLAN",
                  style: TextStyle(
                      color: AppColors.blue_dark,
                      fontFamily: AppFonts.poppins_semiBold,
                      fontSize: 20),
                ),
                JTitle(
                  title: plan.plan,
                  color: AppColors.blue_dark,
                  font: AppFonts.poppins_bold,
                ),
                SpeedContainer(
                  downloadSpeed: "${plan.velocidadBaja} Mb",
                  uploadSpeed: "${plan.velocidadSubida} Mb",
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    children: [
                      Text(
                        "TOTAL A PAGAR",
                        style: TextStyle(
                          fontFamily: AppFonts.poppins_semiBold,
                          color: AppColors.blue_dark,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 34),
                        width: 300,
                        padding: EdgeInsets.only(
                            top: 10, bottom: 10, left: 20, right: 20),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(2, 144, 223, 1),
                            borderRadius: BorderRadius.circular(25)),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 5,
                              child: Text(
                                plan.precio,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontFamily: "fontSubTitle",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                "/",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontFamily: "fontSubTitle",
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: Text(
                                plan.precioBs,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontFamily: "fontSubTitle",
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          JButton(
            label: "CONFIRMAR",
            background: AppColors.green_color,
            onTab: _requestChangePlan,
          )
        ],
      ),
    );
  }

  Future _requestChangePlan() {
    print("TEt");
    Navigator.pushNamed(context, "/change-plan-sent");
  }
}
