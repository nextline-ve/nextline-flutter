import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/label_text.dart';
import 'package:nextline/utils/app_fonts.dart';

class HUserInformation extends StatefulWidget {
  final String userName;

  const HUserInformation({
    Key key,
    @required this.userName,
  }) : super(key: key);

  @override
  _HUserInformationState createState() => _HUserInformationState();
}

class _HUserInformationState extends State<HUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Container(
        padding: EdgeInsets.only(left: 34, ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.account_circle,
              size: 80,
              color: Colors.white,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HLabelText(title: "usuario".toUpperCase()),
                  Text(
                    StringUtils.capitalize(widget.userName, allWords: true),
                    style: TextStyle(
                        fontFamily: AppFonts.input,
                        fontSize: 20,
                        color: Colors.white),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
