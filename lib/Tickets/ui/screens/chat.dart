import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/item_detail_header.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jtext_field.dart';
import 'package:nextline/widgets/line.dart';

class Chat extends StatefulWidget {
  final bool isClient = true;
  final String userName = "oscar castillejo";

  @override
  State<StatefulWidget> createState() {
    return _Chat();
  }
}

class _Chat extends State<Chat> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'ASISTENCIA TÉCNICA',
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: Stack(
        children: [
          Container(
            child: Column(
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                  child: ItemDetailHeader(
                      id: "Ticket2956",
                      label: "Sin Internet",
                      date: "01/08/2020",
                      status: "Técnico Asignado",
                      reverseLeft: true),
                ),
                Container(
                  child: Expanded(
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: [
                        _message(context, "", "", "", true,
                            "assets/images/facturacion.png"),
                        _message(context, "", "", "", false),
                        _message(context, "", "", "", false),
                        _message(context, "", "", "", true),
                        _message(context, "", "", "", false,
                            "assets/images/change_plan.png"),
                      ],
                    ),
                  ),
                ),
                _box()
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget _box() {
  return Container(
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Line(
          width: 100,
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                color: Colors.white,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(
                            bottom: 15, right: 5, left: 10),
                        child: JTextField(
                            backgoundColor: AppColors.white_color,
                            label: "Escribe tu Mensaje",
                            inputType: TextInputType.text,
                            isPass: false,
                            iconRigth: Icon(
                              Icons.file_upload,
                              color: AppColors.blue,
                            ),
                            onValidator: null,
                            onKeyValue: (val) {
                              return val;
                            }),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.blue_dark),
                      child: Icon(
                        Icons.send,
                        color: AppColors.white_color,
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}

Widget _nameLabel(String text) {
  return Text(
    StringUtils.capitalize(text),
    textAlign: TextAlign.center,
    style: TextStyle(
        fontFamily: AppFonts.poppins_bold,
        fontSize: 10,
        color: AppColors.blue_dark),
  );
}

Widget _dateLabel(String text) {
  return Text(
    text,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 10,
        color: AppColors.light_gray_color.withOpacity(1)),
    softWrap: true,
  );
}

Widget _messageContent(String text, bool isLeft) {
  return Text(
    text,
    textAlign: isLeft ? TextAlign.left : TextAlign.right,
    style: TextStyle(
        fontFamily: AppFonts.poppins_regular,
        fontSize: 12,
        color: AppColors.black_color),
    softWrap: true,
  );
}

Widget _message(context, String text, String username, String date, bool isLeft,
    [String image = ""]) {
  List<Widget> children = [
    Container(
      transform: Matrix4.translationValues(0, 10, 0),
      child: Icon(
        Icons.account_circle,
        size: 50,
      ),
    ),
    Container(
      transform: Matrix4.translationValues(isLeft ? -15 : 15, 10, 0),
      child: Icon(isLeft ? Icons.arrow_left : Icons.arrow_right,
          size: 50,
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1)),
    ),
    Expanded(
        child: Container(
      transform: Matrix4.translationValues(isLeft ? -35.5 : 35.5, 0, 0),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: isLeft
              ? AppColors.light_gray_color.withOpacity(0.10)
              : AppColors.ligth_blue_color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _nameLabel("Alberto Zambrano"),
                    _dateLabel("01/08/2020"),
                  ])),
          if (image != "")
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/view-image");
              },
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: Image.asset(image, width: 300)),
            ),
          Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: _messageContent(
                  "Lorem ipsum dolor sit amet,s consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et.",
                  isLeft))
        ],
      ),
    ))
  ];
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: isLeft ? children : children.reversed.toList()),
  );
}
