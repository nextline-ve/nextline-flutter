import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/jbutton.dart';

Future<void> showConfirmationDialog(context, yesAction, noAction,
    {title = const Text("Confirmación"),
    content = const Text("¿Está seguro?")}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return CupertinoAlertDialog(
        title: title,
        content: content,
        actions: <Widget>[
          (Platform.isAndroid)
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                      _showDialogAndroid(context, 'Sí', yesAction),
                      _showDialogAndroid(context, 'Sí', noAction)
                    ])
              : _showDialogIOS(context, 'Sí', yesAction),
          _showDialogIOS(context, 'No', noAction),
        ],
      );
    },
  );
}

Widget _showDialogIOS(context, option, yesNoAction) {
  return CupertinoDialogAction(
    child: Text(option),
    onPressed: () {
      Navigator.of(context).pop();
      yesNoAction();
    },
  );
}

Widget _showDialogAndroid(context, option, yesNoAction) {
  return JButton(
      label: option,
      background: AppColors.ligth_blue_color,
      buttonHeight: 40,
      minWidth: 100,
      padding: EdgeInsets.all(10),
      onTab: () {
        Navigator.pop(context);
        yesNoAction();
      });
}
