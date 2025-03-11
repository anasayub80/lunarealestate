import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  final bool? isLocal;
  String url;
  ImageView({Key? key, required this.url, this.isLocal = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff090C1D),
        ),
        body: Container(
          color: Color(0xff141414),
          child: Center(
            child: PhotoView(
              backgroundDecoration: BoxDecoration(
                color: Color(0xff090C1D),
              ),
              imageProvider: isLocal!
                  ? AssetImage(url) as ImageProvider<Object>
                  : NetworkImage(url) as ImageProvider<Object>,
            ),
          ),
        ));
  }
}
