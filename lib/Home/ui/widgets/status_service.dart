import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class HStatusService extends StatefulWidget {
  final String status;
  HStatusService({Key key, this.status}) : super(key: key);

  @override
  _HStatusServiceState createState() => _HStatusServiceState();
}

class _HStatusServiceState extends State<HStatusService> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              _statusLabelText(),
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      color: AppColors.gray_text_color.withOpacity(0.07)),
                  margin: EdgeInsets.symmetric(horizontal: 36),
                  padding: EdgeInsets.symmetric(horizontal: 21, vertical: 5),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statusText(widget.status),
                        Icon(
                          Icons.arrow_drop_down_circle,
                          color: AppColors.red_color,
                          size: 20,
                        )
                      ]))
            ],
          ),
        ),
      ),
    );
  }
}

Widget _statusLabelText() {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10),
    child: Text("Estatus de la solicitud".toUpperCase(),
        style: TextStyle(
            fontFamily: AppFonts.subTitle,
            fontSize: 10,
            color: AppColors.gray_text_color)),
  );
}

Widget _statusText(String status) {
  return Text(status.toUpperCase(),
      style: TextStyle(
          fontFamily: AppFonts.poppins_regular,
          fontSize: 16,
          color: AppColors.blue_dark));
}
