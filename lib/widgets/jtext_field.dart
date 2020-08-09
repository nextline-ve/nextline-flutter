import 'package:flutter/material.dart';

typedef StringValue = String Function(String);

class  JTextField extends  StatefulWidget {
  final String label;
  final bool isPass;
  final Icon icon;
  final TextInputType inputType;
  final StringValue onValidator;
  final StringValue onKeyValue;

  const JTextField({
    Key key,
    @required this.label,
    @required this.inputType,
    @required this.isPass,
    @required this.onValidator,
    @required this.onKeyValue,
    this.icon
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
          hintStyle: TextStyle(
              color: Colors.grey,
              fontFamily: 'fontInput'
          ),
          filled: true,
          fillColor: Colors.white,
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