import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class DropdownWidget extends StatefulWidget {
  final String hintText;
  DropdownWidget({Key key, this.hintText}) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String dropdownValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      isExpanded: true,
      underline: Container(
        height: 0,
      ),
      icon: Icon(
        Icons.keyboard_arrow_down,
        color: AppColors.blue_dark,
      ),
      hint: Text(
        "Seleccione una avería",
        style: TextStyle(
            color: AppColors.black_color.withOpacity(0.34),
            fontFamily: AppFonts.poppins_regular,
            fontSize: 16),
      ),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(
          color: AppColors.blue_dark,
          fontFamily: AppFonts.poppins_regular,
          fontSize: 18),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['One', 'Two', 'Free', 'Four']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
