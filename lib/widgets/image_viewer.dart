import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ImageViewer();
  }
}

class _ImageViewer extends State<ImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.blue_dark,
        ),
        body: Stack(children: [
          Container(
            child: PhotoView(
              imageProvider: AssetImage("assets/images/facturacion.png"),
              minScale: 1 * 0.55,
              maxScale: 1 * 1.55,
            ),
          )
        ]));
  }
}
