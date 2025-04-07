import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lunarestate/Admin/AppTheme.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

// ignore: must_be_immutable
class textBox extends StatelessWidget {
  String hint;
  TextInputType Ktype;
  var icon;
  final bool isSvg;
  final bool readOnly;
  String? Function(String?) validator;
  void Function(String)? onFieldSubmitted;
  textBox({
    Key? key,
    required TextEditingController controller,
    required this.hint,
    this.readOnly = false,
    required this.icon,
    required this.validator,
    required this.Ktype,
    this.onFieldSubmitted,
    this.isSvg = false,
  })  : _emailController = controller,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3B3C3E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: Color(0xff646566),
        ),
      ),
      height: 55,
      child: Center(
        child: TextFormField(
          onFieldSubmitted: onFieldSubmitted,
          cursorColor: AppThemes.primaryColor,
          autofocus: false,
          readOnly: readOnly,
          validator: validator,
          style: TextStyle(color: Colors.white),
          keyboardType: Ktype,
          controller: _emailController,
          decoration: InputDecoration(
              hintText: hint,
              // !! parse the whole Svg widget in "icon", but make sure you have "isSvg" enabled.
              // !! -jawad
              icon: icon != null
                  ? isSvg
                      ? icon
                      : Icon(icon, color: AppThemes.primaryColor)
                  : null,
              // focusColor: AppThemes.primaryColor,
              focusedBorder: InputBorder.none,
              labelStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey,
                fontWeight: FontWeight.normal,
              ),
              enabledBorder: InputBorder.none,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: Colors.grey,
              )),
        ).addPadding(left: 20),
      ),
    );
  }
}

class PassTextBox extends StatefulWidget {
  final String hint;
  final TextEditingController passwordController;

  PassTextBox({
    Key? key,
    required this.passwordController,
    required this.hint,
  }) : super(key: key);

  @override
  State<PassTextBox> createState() => _PassTextBoxState();
}

class _PassTextBoxState extends State<PassTextBox> {
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    // Initialize password visibility
    _passwordVisible = false;
  }

  @override
  void dispose() {
    // If the controller was initialized here, dispose of it.
    // However, in this case, it's passed from outside, so do not dispose it.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff3B3C3E),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Color(0xff646566)),
      ),
      height: 55,
      child: Center(
        child: TextFormField(
          controller: widget.passwordController, // Passed controller is used
          cursorColor: AppThemes.primaryColor,
          style: TextStyle(color: Colors.white),
          keyboardType: TextInputType.visiblePassword,
          obscureText: !_passwordVisible, // Manage password visibility
          decoration: InputDecoration(
            hintText: widget.hint,
            suffixIcon: IconButton(
              icon: Icon(
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: AppThemes.secondarycolor,
              ),
              onPressed: () {
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            focusedBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey),
          ),
        ).addPadding(left: 20, top: 5, right: 10, bottom: 5),
      ),
    );
  }
}
