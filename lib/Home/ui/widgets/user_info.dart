import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/widgets/label_text.dart';
import 'package:nextline/Home/ui/widgets/profile_image.dart';
import 'package:nextline/utils/app_fonts.dart';

class HUserInformation extends StatefulWidget {
  final String userName;
  final String avatar;
  const HUserInformation({
    Key key,
    @required this.userName,
    @required this.avatar,
  }) : super(key: key);

  @override
  _HUserInformationState createState() => _HUserInformationState();
}

class _HUserInformationState extends State<HUserInformation> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10, top: 10),
      child: Container(
        padding: EdgeInsets.only(
          left: 34,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileImageSelector(
              size: 80,
              withAction: false,
              color: Colors.white,
              imageUrl: (widget.avatar == null)
                  ? "https://picsum.photos/200/300"
                  : widget.avatar,
              loadPadding: EdgeInsets.all(0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 7, left: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HLabelText(title: "usuario".toUpperCase()),
                  Text(
                    StringUtils.capitalize(
                        widget.userName != null ? widget.userName : "",
                        allWords: true),
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
