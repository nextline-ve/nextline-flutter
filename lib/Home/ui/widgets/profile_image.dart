import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/utils/app_colors.dart';

class ProfileImageSelector extends StatefulWidget {
  final picker = ImagePicker();
  ProfileImageSelector({Key key}) : super(key: key);
  @override
  _ProfileImageSelectorState createState() => _ProfileImageSelectorState();
}

class _ProfileImageSelectorState extends State<ProfileImageSelector> {
  File imageFile;

  void getImage(ImageSource source) {
    widget.picker.getImage(source: source).then((pickedFile) => setState(() {
          imageFile = File(pickedFile.path);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  autofocus: false,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  onPressed: () => {_showMyDialog()},
                  child: imageFile != null
                      ? ClipOval(
                          child: Image.file(
                            imageFile,
                            height: 136,
                            width: 136,
                            fit: BoxFit.cover,
                          ),
                        )
                      : Icon(
                          Icons.account_circle,
                          size: 136,
                          color: AppColors.blue_dark,
                        ),
                ),
                Container(
                  padding: EdgeInsets.all(6),
                  transform: Matrix4.translationValues(40, -40, 0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(24),
                      color: AppColors.blue),
                  child: Icon(
                    Icons.camera_alt,
                    size: 16,
                    color: AppColors.white_color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _showMyDialog() async {
    final content = Text('Tomar una foto con la camara o de la galeria?');
    final title = Text('Seleccionar foto de perfil');

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
              RaisedButton(
                color: AppColors.blue,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Camara'),
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
                    Text('Galeria'),
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
    return CupertinoAlertDialog(
      title: title,
      content: content,
      actions: [
        CupertinoDialogAction(
          child: Text("Camara"),
          onPressed: () => {getImage(ImageSource.camera)},
        ),
        CupertinoDialogAction(
          child: Text("Galeria"),
          onPressed: () => {getImage(ImageSource.gallery)},
        )
      ],
    );
  }
}
