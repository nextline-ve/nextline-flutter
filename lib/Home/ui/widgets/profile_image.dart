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

  void getImage() {
    widget.picker
        .getImage(source: ImageSource.camera)
        .then((pickedFile) => setState(() {
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
                  onPressed: () => {getImage()},
                  child: imageFile != null
                      ? CircleAvatar(
                          radius: 20,
                          child: Image.file(
                            imageFile,
                            height: 140,
                            width: 100,
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
}
