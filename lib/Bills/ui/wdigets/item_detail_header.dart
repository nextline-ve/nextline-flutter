import 'package:flutter/material.dart';
import 'package:nextline/Bills/ui/wdigets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';

class ItemDetailHeader extends StatefulWidget {
  final String label;
  final String status;
  final String id;
  final String date;
  final bool reverseLeft;

  const ItemDetailHeader({
    Key key,
    @required this.label,
    @required this.id,
    @required this.date,
    @required this.status,
    this.reverseLeft = false,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ItemDetailHeaderState();
  }
}

class _ItemDetailHeaderState extends State<ItemDetailHeader> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Column(
          verticalDirection: widget.reverseLeft
              ? VerticalDirection.up
              : VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.label,
                style: TextStyle(
                    color: widget.reverseLeft
                        ? AppColors.black_color
                        : AppColors.blue,
                    fontSize: widget.reverseLeft ? 12 : 18,
                    fontFamily: AppFonts.poppins_light),
              ),
            ),
            Container(
              child: Text(
                widget.id,
                style: TextStyle(
                    color: AppColors.blue_dark,
                    fontSize: widget.reverseLeft ? 16 : 24,
                    fontFamily: AppFonts.poppins_bold),
              ),
            ),
          ],
        )),
        Expanded(
            child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 6, top: 14),
                child: ColoredLabel(text: widget.status),
              ),
              Container(
                child: Text(
                  _getDate(widget.date),
                  style: TextStyle(
                      fontFamily: AppFonts.poppins_light,
                      color: AppColors.black_color),
                ),
              ),
            ],
          ),
        )),
      ],
    );
  }
}

String _getDate(dateToParse) {
  DateTime date = DateTime.parse(dateToParse);
  return "${date.day}/${date.month}/${date.year}";
}
