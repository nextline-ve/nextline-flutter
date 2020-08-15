import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class JButton extends StatefulWidget {
  final String label;
  final Color background;
  final VoidCallback onTab;
  final double top;
  final labelColor;
  final borderColor;
  final buttonHeight;

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
      height: (widget.buttonHeight == null) ? 60 : widget.buttonHeight,
      disabledColor: AppColors.gray_text_color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
          padding: EdgeInsets.all(20),
          child: RaisedButton(
            onPressed: widget.onTab,
            color: (widget.background == null)
                ? AppColors.ligth_blue_color
                : widget.background,
            child: Text(
              widget.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: (widget.labelColor == null) ? Colors.white : widget.labelColor, fontFamily: AppFonts.fontTitle),
            ),
          )),
    );
  }
}
