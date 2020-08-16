import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/ui/widgets/plans.dart';

class ScrollPlans extends StatefulWidget {
  final Axis scrollDirection;
  final List<Map> children;
  const ScrollPlans({
    Key key,
    @required this.scrollDirection,
    @required this.children,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ScrollPlans();
  }
}

class _ScrollPlans extends State<ScrollPlans> {
  @override
  Widget build(BuildContext context) {
    return widget.scrollDirection == Axis.horizontal
        ? _scrollableContainer()
        : Expanded(child: _scrollableContainer());
  }

  Widget _scrollableContainer() {
    return Container(
      height: 295,
      child: ListView(
        scrollDirection: widget.scrollDirection,
        children: widget.children
            .map((plan) => Plans(
                  id: plan["id"],
                  planName: plan["planName"],
                  priceBs: plan["priceBs"],
                  priceUsd: plan["priceUsd"],
                  uploadSpeed: plan["uploadSpeed"],
                  downloadSpeed: plan["downloadSpeed"],
                ))
            .toList(),
      ),
    );
  }
}
