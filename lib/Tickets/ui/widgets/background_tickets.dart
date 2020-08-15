import 'package:flutter/material.dart';

class BackgroundTickets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: Alignment.center, children: [
      Container(
        height: null,
        decoration: BoxDecoration(
          color: Colors.black87,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/images/fondo_app.png"),
          ),
        ),
      ),
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitWidth,
            alignment: Alignment.topCenter,
            image: AssetImage("assets/images/fondo_top_tickets.png"),
          ),
        ),
      ),
    ]);
  }
}
