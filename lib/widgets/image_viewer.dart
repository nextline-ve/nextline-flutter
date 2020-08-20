import 'package:flutter/material.dart';
import 'package:nextline/utils/app_colors.dart';
import 'package:photo_view/photo_view.dart';

class ImageViewer extends StatefulWidget {
  final String image;

  const ImageViewer({Key key, @required this.image}) : super(key: key);

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
              imageProvider: AssetImage(widget.image),
              minScale: 1 * 0.55,
              maxScale: 1 * 1.55,
            ),
          )
        ]));
  }
}
