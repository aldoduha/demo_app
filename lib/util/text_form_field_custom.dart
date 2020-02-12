
import 'package:flutter/material.dart';

class TextFormFieldCustom extends StatefulWidget {

  final String initValue;
  final String hintText;
  final bool obscureText = false;
  final bool autoFocus = false;
  final TextEditingController controller;
  final Widget icon;

  TextFormFieldCustom({this.initValue, this.hintText, obscureText, autoFocus, this.controller, this.icon});

  @override
  _TextFormFieldCustom createState() => _TextFormFieldCustom();
}

class _TextFormFieldCustom extends State<TextFormFieldCustom> {

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      autofocus: widget.autoFocus,
      initialValue: widget.initValue,
      obscureText: widget.obscureText,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        hintText: widget.hintText,
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
  }

}