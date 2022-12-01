import 'package:flutter/material.dart';

// ignore: must_be_immutable
class textBox extends StatelessWidget {
  String hint;
  TextInputType Ktype;
  var icon;
  textBox({
    Key? key,
    required TextEditingController emailController,
    required this.hint,
    required this.icon,
    required this.Ktype,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        cursorColor: Colors.amber,
        autofocus: false,
        style: TextStyle(color: Colors.white),
        keyboardType: Ktype,
        controller: _emailController,
        decoration: InputDecoration(
            label: Text(
              hint,
            ),
            icon: Icon(icon, color: Colors.white),
            focusColor: Colors.amber,
            labelStyle: TextStyle(
              fontSize: 15,
              color: Colors.amber,
              fontWeight: FontWeight.normal,
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}

// ignore: must_be_immutable
class passTextBox extends StatefulWidget {
  String hint;
  passTextBox({
    Key? key,
    required TextEditingController passwordController,
    required this.hint,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  State<passTextBox> createState() => _passTextBoxState();
}

class _passTextBoxState extends State<passTextBox> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: TextFormField(
        autofocus: false,
        cursorColor: Colors.amber,
        style: TextStyle(color: Colors.white),
        controller: widget._passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: !_passwordVisible,
        decoration: InputDecoration(
            label: Text(widget.hint, selectionColor: Colors.white),
            icon: Icon(Icons.lock_outlined, color: Colors.white),
            focusColor: Colors.amber,
            labelStyle: TextStyle(
              color: Colors.amber,
              fontSize: 15,
            ),
            suffixIcon: IconButton(
              icon: Icon(
                // Based on passwordVisible state choose the icon
                _passwordVisible ? Icons.visibility : Icons.visibility_off,
                color: Theme.of(context).primaryColorDark,
              ),
              onPressed: () {
                // Update the state i.e. toogle the state of passwordVisible variable
                setState(() {
                  _passwordVisible = !_passwordVisible;
                });
              },
            ),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white),
            ),
            fillColor: Colors.white,
            hintStyle: TextStyle(
              color: Colors.white,
            )),
      ),
    );
  }
}
