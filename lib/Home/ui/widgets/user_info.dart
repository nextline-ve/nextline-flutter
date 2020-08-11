import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/label_text.dart';
import 'package:nextline/utils/app_fonts.dart';

class HUserInformation extends StatelessWidget {
  const HUserInformation({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(Icons.account_circle),
          Column(
            children: [
              HLabelText(title: "usuario"),
              Text(
                "Oscar2",
                style: TextStyle(fontFamily: AppFonts.input),
              )
            ],
          )
        ],
      ),
    );
  }
}
