import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/jtext_field.dart';

typedef FutureValue = Future<dynamic> Function(String);

class EditableInput extends StatefulWidget {
  final String value;
  final String placeholder;
  final FutureValue onSave;
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
  bool saving = false;
  String editedValue = "";
  Future res;

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
                      initialValue:
                          editedValue == "" ? widget.value : editedValue,
                    ))
                : Padding(
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    child: Text(
                      widget.value == "" || widget.value == null
                          ? "No hay datos"
                          : editedValue == "" ? widget.value : editedValue,
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
                setState(() {
                  saving = true;
                });
                res = widget.onSave(editedValue);
                res.then((value) {
                  setState(() {
                    saving = false;
                  });
                });
              }
              setState(() {
                edit = !edit;
              });
            },
            child: Container(
                padding: EdgeInsets.all(10),
                child: edit
                    ? Icon(Icons.check, color: Color.fromRGBO(2, 144, 223, 1))
                    : saving
                        ? SizedBox(
                            child: CircularProgressIndicator(
                              strokeWidth: 2.5,
                            ),
                            height: 20.0,
                            width: 20.0,
                          )
                        : Icon(Icons.border_color,
                            color: Color.fromRGBO(2, 144, 223, 1))),
          ),
      ])
    ]);
  }
}
