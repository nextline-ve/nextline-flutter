import 'package:flutter/material.dart';
import 'package:nextline/BillDetails/ui/wdigets/colored_label.dart';
import 'package:nextline/utils/app_colors.dart';

class ItemDetailHeader extends StatefulWidget {
  final String label;
  final String status;
  final String id;
  final String date;

  const ItemDetailHeader({
    Key key,
    @required this.label,
    @required this.id,
    @required this.date,
    @required this.status,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.label,
                style: TextStyle(color: AppColors.blue, fontSize: 21),
              ),
              Text(
                widget.id,
                style: TextStyle(color: AppColors.blue_dark, fontSize: 23),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              ColoredLabel(text: widget.status),
              Container(
                padding: EdgeInsets.fromLTRB(7, 7, 0, 0),
                child: Text(widget.date),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
