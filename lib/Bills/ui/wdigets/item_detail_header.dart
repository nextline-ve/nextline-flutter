import 'dart:math';

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
    return Column(
      children: [
        Row(
          verticalDirection: widget.reverseLeft
              ? VerticalDirection.up
              : VerticalDirection.down,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                widget.id,
                style: TextStyle(
                    color: AppColors.blue_dark,
                    fontSize: widget.reverseLeft ? 16 : 24,
                    fontFamily: AppFonts.poppins_bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 6, top: 14),
              child: ColoredLabel(text: widget.status),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: Text(
                widget.label.substring(0, min(30, widget.label.length)) +
                    (widget.label.length > 30 ? ". . ." : ""),
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
                widget.date,
                style: TextStyle(
                    fontFamily: AppFonts.poppins_light,
                    color: AppColors.black_color),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
