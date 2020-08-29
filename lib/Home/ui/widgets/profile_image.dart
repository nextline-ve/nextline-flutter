import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:nextline/widgets/upload_image_modal.dart';

class ProfileImageSelector extends StatefulWidget {
  final picker = ImagePicker();
  final File imageFile;
  final String imageUrl;
  final bool withAction;
  final double size;
  final Color color;
  ProfileImageSelector({
    Key key,
    this.imageFile,
    this.imageUrl,
    this.color = AppColors.blue_dark,
    this.size = 136,
    this.withAction = true,
  }) : super(key: key);
  @override
  _ProfileImageSelectorState createState() =>
      _ProfileImageSelectorState(imageFile: imageFile);
}

class _ProfileImageSelectorState extends State<ProfileImageSelector> {
  File imageFile;
  _ProfileImageSelectorState({this.imageFile}) : super();
  void getImage(ImageSource source) {
    widget.picker.getImage(source: source).then((pickedFile) => setState(() {
          imageFile = File(pickedFile.path);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              FlatButton(
                autofocus: false,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                onPressed: () => {
                  if (widget.withAction)
                    {
                      showMyDialog(
                          context, "Seleccione su foto de perfil", getImage)
                    }
                },
                child: imageFile != null || widget.imageUrl != null
                    ? ClipOval(
                        child: imageFile != null
                            ? Image.file(
                                imageFile,
                                height: widget.size,
                                width: widget.size,
                                fit: BoxFit.cover,
                              )
                            : Image.network(
                                widget.imageUrl,
                                height: widget.size,
                                width: widget.size,
                                fit: BoxFit.cover,
                              ))
                    : Icon(
                        Icons.account_circle,
                        size: widget.size,
                        color: widget.color,
                      ),
              ),
              widget.withAction
                  ? Container(
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
                    )
                  : Text(""),
            ],
          ),
        ],
      ),
    );
  }
}
