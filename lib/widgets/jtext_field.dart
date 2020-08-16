import 'package:flutter/material.dart';

typedef StringValue = String Function(String);

class JTextField extends StatefulWidget {
  final String label;
  final bool isPass;
  final Icon icon;
  final Icon iconRigth;
  final Color backgoundColor;
  final TextInputType inputType;
  final StringValue onValidator;
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
      this.icon,
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
      margin: EdgeInsets.only(top: 20),
      child: TextFormField(
        initialValue: widget.initialValue,
        autofocus: true,
        obscureText: widget.isPass,
        keyboardType: widget.inputType,
        maxLines: (widget.inputType == TextInputType.multiline) ? null : 1,
        validator: widget.onValidator,
        onSaved: widget.onKeyValue,
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
