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
      decoration: BoxDecoration(
        border: Border.all(
          color: (widget.borderColor == null)
              ? AppColors.gray_color
              : widget.borderColor,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      margin: EdgeInsets.only(top: (widget.top == null) ? 20 : widget.top),
      child: TextFormField(
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
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
