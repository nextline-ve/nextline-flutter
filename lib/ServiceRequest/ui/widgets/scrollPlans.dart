import 'package:flutter/material.dart';
import 'package:nextline/ServiceRequest/model/model_plans.dart';
import 'package:nextline/ServiceRequest/ui/widgets/plans.dart';

class ScrollPlans extends StatefulWidget {
  final Axis scrollDirection;
  final List<ModelPlans> children;
  final String pushUrl;

  const ScrollPlans({
    Key key,
    @required this.scrollDirection,
    @required this.children,
    this.pushUrl: '/personal-form',
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
      height: 320,
      child: ListView(
        scrollDirection: widget.scrollDirection,
        children: widget.children
            .map((ModelPlans plan) => Plans(
                  id: plan.id,
                  planName: plan.plan,
                  priceBs: plan.precioBs,
                  priceUsd: plan.precio,
                  uploadSpeed: plan.velocidadSubida.toString(),
                  downloadSpeed: plan.velocidadBajada.toString(),
                  pushUrl: widget.pushUrl,
                ))
            .toList(),
      ),
    );
  }
}
