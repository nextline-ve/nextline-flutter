import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/label_text.dart';
import 'package:nextline/utils/app_fonts.dart';

class HServiceType extends StatelessWidget {
  final String title;
  final Color color;

  const HServiceType({Key key, @required this.title, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        HLabelText(title: "Tipo de Servicio"),
        _serviceTypeText(this.title)
      ],
    );
  }
}

Widget _serviceTypeText(String title) {
  return Container(
      padding: EdgeInsets.only(bottom: 15),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
          fontFamily: AppFonts.poppins_light,
          fontSize: 25,
        ),
      ));
}
