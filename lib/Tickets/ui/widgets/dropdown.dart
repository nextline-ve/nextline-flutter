import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class DropdownWidget<T> extends StatefulWidget {
  final String hintText;
  final List<T> options;
  final void Function(String) onChanged;
  final String value;
  DropdownWidget(
      {Key key, this.hintText, this.options, this.value, this.onChanged})
      : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: widget.value,
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
      onChanged: widget.onChanged,
      items: widget.options.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
            value: value.id.toString(), child: Text(value.descripcion));
      }).toList(),
    );
  }
}
