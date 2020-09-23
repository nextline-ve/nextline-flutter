import 'dart:io';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';

Future<void> showConfirmationDialog(context, yesAction, noAction,
    {title = const Text("Confirmación"),
    content = const Text("¿Está seguro?")}) async {
  if (Platform.isAndroid) {
    return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: title,
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  content,
                ],
              ),
            ),
            actions: <Widget>[
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                JButton(
                    label: "Sí",
                    background: AppColors.ligth_blue_color,
                    buttonHeight: 40,
                    minWidth: 100,
                    padding: EdgeInsets.all(10),
                    onTab: () {
                      Navigator.pop(context);
                      yesAction();
                    }),
                JButton(
                    label: "No",
                    background: AppColors.ligth_blue_color,
                    buttonHeight: 40,
                    minWidth: 100,
                    padding: EdgeInsets.all(10),
                    onTab: () {
                      Navigator.pop(context);
                      noAction();
                    }),
              ])
            ],
          );
        });
  }
}
