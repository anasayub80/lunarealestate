import 'package:flutter/material.dart';

extension EmptySpace on num {
  SizedBox get height => SizedBox(height: toDouble());

  SizedBox get width => SizedBox(width: toDouble());
}

extension PaddingWidget on Widget {
// changed name cause container was giving issue recognising only 'padding'
  Widget addPadding({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? horizontal,
    double? vertical,
    double? overall,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: left ?? horizontal ?? overall ?? 0.0,
        top: top ?? vertical ?? overall ?? 0.0,
        right: right ?? horizontal ?? overall ?? 0.0,
        bottom: bottom ?? vertical ?? overall ?? 0.0,
      ),
      child: this,
    );
  }

  Widget center() => Center(child: this);
}
