import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/Profile/ui/screens/profile_screen.dart';
import 'package:nextline/utils/app_colors.dart';

class NavigatorBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _NavigatorBar();
  }
}

class _NavigatorBar extends State<NavigatorBar> {
  int _currentIndex = -1;

  List<IconData> items = [
    Icons.home,
    Icons.person,
  ];

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
    switch (_currentIndex) {
      case 0:
        if (ModalRoute.of(context).settings.name == "/home") {
          return;
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomeScreen()));
        break;

      case 1:
        if (ModalRoute.of(context).settings.name == "/profile") {
          return;
        }
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => ProfileScreen()));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 40),
      margin: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
      decoration: BoxDecoration(
          color: AppColors.blue_dark,
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: AppColors.gray_shadow_color,
              blurRadius: 20,
              spreadRadius: 10,
            )
          ]),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: items
              .asMap()
              .entries
              .map(
                (entry) => Container(
                  child: ButtonTheme(
                    height: 30,
                    buttonColor: AppColors.blue_dark,
                    disabledColor: AppColors.blue_dark,
                    child: IconButton(
                      color: AppColors.blue_dark,
                      onPressed: () => onTapped(entry.key),
                      icon: Icon(
                        entry.value,
                        color: _currentIndex == entry.key
                            ? Colors.white.withOpacity(0.7)
                            : Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                ),
              )
              .toList()),
    );
  }
}
