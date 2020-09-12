import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/Home/ui/screens/home_screen.dart';
import 'package:nextline/Profile/ui/screens/profile_screen.dart';
import 'package:nextline/utils/app_colors.dart';

class NavigatorBar extends StatefulWidget {
  final List<NavigatorItem> items;
  const NavigatorBar({Key key, this.items: const []}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NavigatorBar();
  }
}

class _NavigatorBar extends State<NavigatorBar> {
  int _currentIndex = -1;

  onTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<NavigatorItem> itemsToShow = widget.items.length > 0
        ? widget.items
        : [
            NavigatorItem(1, Icons.home,
                () => Navigator.pushReplacementNamed(context, '/home')),
            NavigatorItem(2, Icons.person,
                () => Navigator.pushReplacementNamed(context, '/profile'))
          ];

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
          children: itemsToShow
              .map(
                (entry) => Container(
                  child: ButtonTheme(
                    height: 30,
                    buttonColor: AppColors.blue_dark,
                    disabledColor: AppColors.blue_dark,
                    child: IconButton(
                      color: AppColors.blue_dark,
                      onPressed: () {
                        onTapped(entry.key);
                        entry.onPressed();
                      },
                      icon: Icon(
                        entry.icon,
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

class NavigatorItem {
  int key;
  IconData icon;
  void Function() onPressed;

  NavigatorItem(int key, IconData icon, void Function() onPressed) {
    this.key = key;
    this.icon = icon;
    this.onPressed = onPressed;
  }
}
