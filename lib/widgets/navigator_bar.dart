import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';

class NavigatorBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigatorBar();
  }
}

class _NavigatorBar extends State<NavigatorBar> {
  int _currentIndex = 0;

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (_currentIndex) {
      case 0:
        Navigator.pushReplacementNamed(context, '/home');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
        data: Theme.of(context).copyWith(
          canvasColor: AppColors.blue_dark,
          primaryColor: Colors.white70,
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: onTapped,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 30,
                ),
                title: Text("")),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                title: Text(""))
          ],
        ));
  }
}
