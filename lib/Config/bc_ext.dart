import 'package:flutter/cupertino.dart';

extension BuildContextExtension on BuildContext {
  MediaQueryData get mediaQuery => MediaQuery.of(this);
  double get screenHeight => mediaQuery.size.height;
  double get screenWidth => mediaQuery.size.width;
  void pushScreenTo(Widget page) => Navigator.of(this).push(
        CupertinoPageRoute(
          builder: (c) => page,
        ),
      );
  void popFromScreen() => Navigator.pop(this);
  // ignore: non_constant_identifier_names
  void PushReplacementScreenTo(Widget page) =>
      Navigator.of(this).pushReplacement(
        CupertinoPageRoute(
          builder: (c) => page,
        ),
      );
}
