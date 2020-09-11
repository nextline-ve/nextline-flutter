import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/utils/app_fonts.dart';
import 'package:nextline/widgets/navigator_bar.dart';

class TechHomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _TechHomeScreen();
  }
}

class _TechHomeScreen extends State<TechHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue_dark,
        centerTitle: true,
        title: Text(
          'ASIGNACIONES TÉCNICAS',
          textAlign: TextAlign.center,
          style: TextStyle(fontFamily: AppFonts.input, fontSize: 16),
        ),
      ),
      body: Stack(),
      bottomNavigationBar: NavigatorBar(
        items: [
          NavigatorItem(
              1,
              Icons.home,
              () =>
                  Navigator.pushReplacementNamed(context, '/technician-home')),
          NavigatorItem(2, Icons.access_time,
              () => Navigator.pushReplacementNamed(context, '/profile')),
          NavigatorItem(3, Icons.person,
              () => Navigator.pushReplacementNamed(context, '/profile'))
        ],
      ),
    );
  }
}
