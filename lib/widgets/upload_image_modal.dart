import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/utils/app_colors.dart';

Future<void> showMyDialog(context, text, getImage) async {
  final content = Text(
      '¿Deseas tomar una foto con la cámara o subir una foto de la galería?');
  final title = Text(text);

  if (Platform.isAndroid) {
    showDialogAndroid(title, content, context, text, getImage);
  } else {
    showDialogIOS(title, content, context, text, getImage);
  }


}
showDialogAndroid(title, content, context, text, getImage) {
  showDialog<void>(
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
          RaisedButton(
            color: AppColors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Cámara'),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 5),
                  child: Icon(Icons.camera_alt,
                      size: 14, color: AppColors.white_color),
                )
              ],
            ),
            onPressed: () {
              getImage(ImageSource.camera);
              Navigator.of(context).pop();
            },
          ),
          RaisedButton(
            color: AppColors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Galería'),
                Padding(
                  padding: const EdgeInsets.only(top: 2, left: 5),
                  child: Icon(Icons.filter,
                      size: 14, color: AppColors.white_color),
                )
              ],
            ),
            onPressed: () {
              getImage(ImageSource.gallery);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

showDialogIOS(title, content, context, text, getImage) {
  final act = CupertinoActionSheet(
      title: title,
      message: content,
      actions: <Widget>[
        CupertinoActionSheetAction(
          child: Text("Cámara"),
          onPressed: () {
            getImage(ImageSource.camera);
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Galería"),
          onPressed: () {
            getImage(ImageSource.gallery);
            Navigator.pop(context);
          },
        )
      ],
      cancelButton: CupertinoActionSheetAction(
        child: Text('Cancelar'),
        onPressed: () {
          Navigator.pop(context);
        },
      ));
  showCupertinoModalPopup(
      context: context, builder: (BuildContext context) => act);
}