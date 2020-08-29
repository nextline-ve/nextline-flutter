import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jtext_field.dart';

class EditableInput extends StatefulWidget {
  final String value;
  final String placeholder;
  final StringValue onSave;
  final bool readOnly;
  final bool isPassword;
  final StringValue onKeyValue;

  EditableInput({
    Key key,
    @required this.value,
    @required this.placeholder,
    this.readOnly = false,
    this.isPassword = false,
    this.onKeyValue,
    this.onSave,
  }) : super(key: key);

  @override
  _EditableInputState createState() => _EditableInputState();
}

class _EditableInputState extends State<EditableInput> {
  bool edit = false;
  String editedValue = "";

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
        padding: EdgeInsets.only(left: 20),
        child: Text(
          widget.placeholder,
          style: TextStyle(
              color: AppColors.gray_text_color.withOpacity(0.6),
              fontSize: 12,
              fontFamily: AppFonts.fontTitle),
        ),
      ),
      Row(children: [
        Expanded(
            child: edit
                ? Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
                    child: JTextField(
                      backgoundColor: Colors.white,
                      label: widget.placeholder,
                      inputType: TextInputType.text,
                      isPass: widget.isPassword,
                      onKeyValue: (value) {
                        setState(() {
                          editedValue = value;
                        });
                        return value;
                      },
                      initialValue: widget.value,
                    ))
                : Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      widget.value != "" ? widget.value : "No hay datos",
                      style: TextStyle(
                          color: AppColors.blue_dark,
                          fontSize: 16,
                          fontFamily: AppFonts.poppins_regular),
                    ),
                  )),
        if (!widget.readOnly)
          GestureDetector(
            onTap: () {
              if (edit && editedValue != "") {
                widget.onSave(editedValue);
              }
              setState(() {
                edit = !edit;
              });
            },
            child: ClipOval(
                child: edit
                    ? Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.check,
                            color: Color.fromRGBO(2, 144, 223, 1)))
                    : Container(
                        padding: EdgeInsets.all(10),
                        child: Icon(Icons.border_color,
                            color: Color.fromRGBO(2, 144, 223, 1)))),
          ),
      ])
    ]);
  }
}
