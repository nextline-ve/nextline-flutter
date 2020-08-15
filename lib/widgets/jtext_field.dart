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

  const JTextField(
      {Key key,
      @required this.label,
      @required this.inputType,
      @required this.isPass,
      @required this.onValidator,
      @required this.onKeyValue,
      this.iconRigth,
      this.icon,
      this.backgoundColor})
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
        autofocus: true,
        obscureText: widget.isPass,
        keyboardType: widget.inputType,
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
