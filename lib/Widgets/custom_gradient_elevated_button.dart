import 'package:flutter/material.dart';
import 'package:lunarestate/Admin/AppTheme.dart';

class CustomGradientElevatedButton extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double? height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color colorborder;
  const CustomGradientElevatedButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.width,
    this.height = 44.0,
    this.colorborder = Colors.transparent,
    this.gradient = const LinearGradient(colors: [
      AppThemes.primaryColor,
      AppThemes.primaryColor,
    ]),
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: borderRadius,
          border: Border.all(color: Colors.transparent),
        ),
        child: child,
      ),
    );
  }
}

class CustomGradientElevatedButtonCircle extends StatelessWidget {
  final BorderRadiusGeometry? borderRadius;
  final double? width;
  final double height;
  final Gradient gradient;
  final VoidCallback? onPressed;
  final Widget child;
  final Color colorborder;
  final bool isDark;
  const CustomGradientElevatedButtonCircle({
    super.key,
    required this.onPressed,
    required this.child,
    this.borderRadius,
    this.isDark = false,
    this.width,
    this.height = 44.0,
    this.colorborder = Colors.transparent,
    this.gradient = const LinearGradient(colors: [
      Color(0xFF2D2D32),
      Color(0xff232327),
    ]),
  });

  @override
  Widget build(BuildContext context) {
    // final borderRadius = this.borderRadius ?? BorderRadius.circular(10);
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: isDark
              ? gradient
              : const LinearGradient(colors: [
                  Color(0xFFFFFFFF),
                  Color(0xFFF4F4F4),
                ]),
          // borderRadius: borderRadius,

          border: Border.all(color: colorborder, width: 2),
        ),
        child: child,
      ),
    );
  }
}
