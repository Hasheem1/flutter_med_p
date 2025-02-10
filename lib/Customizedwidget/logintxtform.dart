import 'package:flutter/material.dart';

class LoginTxtForm extends StatefulWidget {
  final String lbl;
  final String hint;
  final Icon preIcon;
  final Icon? sufIcon;
  final String? Function(String?)? v;
  final TextEditingController controller;

  LoginTxtForm({
    required this.lbl,
    required this.hint,
    required this.preIcon,
    this.sufIcon,
    this.v,
    required this.controller,
  });

  @override
  _LoginTxtFormState createState() => _LoginTxtFormState();
}

class _LoginTxtFormState extends State<LoginTxtForm> {
  bool _isObscured = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      style: TextStyle(color: Colors.white, fontSize: 27),
      cursorColor: Colors.white,
      validator: widget.v,
      obscureText: _isObscured, // Use the state variable
      decoration: InputDecoration(
        label: Text(widget.lbl, style: TextStyle(color: Colors.white)),
        prefixIcon: widget.preIcon,
        suffixIcon: widget.sufIcon ??
            IconButton(
              onPressed: () {
                setState(() {
                  _isObscured = !_isObscured;
                });
              },
              icon: Icon(
                _isObscured ? Icons.visibility_off : Icons.visibility,
                color: Colors.white,
              ),
            ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange.shade300, width: 3),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.orange, width: 3),
        ),
      ),
    );
  }
}
