import 'package:flutter/material.dart';

class ScrollPlans extends StatefulWidget {
  final Axis scrollDirection;
  final List<Widget> children;
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
        children: widget.children,
      ),
    );
  }
}
