import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';

typedef StringValue = String Function(String);

class JTextField extends StatefulWidget {
  final String label;
  final bool isPass;
  final Icon icon;
  final Icon iconRigth;
  final Color backgoundColor;
  final Color borderColor;
  final TextInputType inputType;
  final StringValue onValidator;
  final double top;
  final StringValue onKeyValue;
  final String initialValue;
  final bool disable;
  final int minLines;
  final int maxLength;

  const JTextField(
      {Key key,
      @required this.label,
      @required this.inputType,
      @required this.onKeyValue,
      this.onValidator,
      this.isPass = false,
      this.iconRigth,
      this.borderColor,
      this.icon,
      this.top,
      this.backgoundColor,
      this.minLines,
      this.maxLength,
      this.disable = false,
      this.initialValue})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _JTextField();
  }
}

class _JTextField extends State<JTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: (widget.top == null) ? 20 : widget.top),
      child: TextFormField(
        maxLength: widget.maxLength,
        readOnly: widget.disable,
        initialValue: widget.initialValue,
        autofocus: false,
        obscureText: widget.isPass,
        keyboardType: widget.inputType,
        maxLines: (widget.inputType == TextInputType.multiline) ? null : 1,
        validator: widget.onValidator,
        onSaved: widget.onKeyValue,
        onChanged: widget.onKeyValue,
        decoration: InputDecoration(
            prefixIcon: (widget.icon == null) ? null : widget.icon,
            hintText: widget.label,
            hintStyle: TextStyle(color: Colors.grey, fontFamily: 'fontInput'),
            suffixIcon: widget.iconRigth,
            filled: true,
            fillColor: widget.backgoundColor != null
                ? widget.backgoundColor
                : Colors.white,
            enabledBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(
                  color: (widget.borderColor == null)
                      ? Colors.white
                      : widget.borderColor),
            ),
            focusedBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(
                  color: (widget.borderColor == null)
                      ? Colors.white
                      : widget.borderColor),
            ),
            errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(25.0)),
              borderSide: BorderSide(color: Colors.red, width: 2.5),
            )),
      ),
    );
  }
}
