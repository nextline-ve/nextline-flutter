import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class JButton extends StatefulWidget {
  final String label;
  final labelColor;
  final borderColor;
  final Color background;
  final VoidCallback onTab;
  final double top;
  final double buttonHeight;

  const JButton(
      {Key key,
      @required this.label,
      @required this.onTab,
      @required this.top,
      this.labelColor,
      this.borderColor,
      this.buttonHeight,
      this.background})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _JButton();
  }
}

class _JButton extends State<JButton> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ButtonTheme(
      minWidth: 380,
      height: 60,
      disabledColor: Colors.grey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
    return Container(
      height: (widget.buttonHeight == null)
        ? 60.0
        : widget.buttonHeight,
      margin: EdgeInsets.only(top: widget.top, left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        border: (widget.borderColor == null)
          ? Border.all(color: Colors.blueAccent)
          :  Border.all(color: widget.borderColor) ,
        borderRadius: BorderRadius.circular(25.0),
        color: (widget.background == null)
            ? Color.fromRGBO(82, 192, 242, 1)
            : widget.background,
      ),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            onPressed: widget.onTab,
            color: (widget.background == null) ? AppColors.ligth_blue_color : widget.background,
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontFamily: AppFonts.fontTitle),
            ),
          )),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
            onTap: widget.onTab,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: Center(
                child: Text(
                  widget.label,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 16.0,
                      fontFamily: "fontTitle",
                      color: (widget.labelColor == null)
                        ? Colors.white
                        : widget.labelColor),
                ),
              ),
            )),
      ),
    );
  }
}
