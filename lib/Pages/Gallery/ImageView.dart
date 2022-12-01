import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

// ignore: must_be_immutable
class ImageView extends StatelessWidget {
  String url;
  ImageView({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Color(0xff141414),
      child: Center(
        child: PhotoView(
          backgroundDecoration: BoxDecoration(
            color: Color(0xff090C1D),
          ),
          imageProvider: NetworkImage(url),
        ),
      ),
    ));
  }
}
