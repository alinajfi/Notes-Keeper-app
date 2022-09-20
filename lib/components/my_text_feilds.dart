import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  const MyTextFeild({
    Key? key,
    required this.controller,
    required this.maxLines,
    required this.minLines,
    required this.hintText,
    this.maxLength,
    this.counterStyle,
    this.hintStyle,
    required this.boxConstraints,
  }) : super(key: key);

  final TextEditingController controller;
  final int maxLines;
  final int minLines;
  final String hintText;
  final int? maxLength;
  final TextStyle? counterStyle;
  final TextStyle? hintStyle;
  final BoxConstraints boxConstraints;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: true,
      cursorColor: Colors.amber,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: hintStyle,
        constraints: boxConstraints,
        counterStyle: counterStyle,
      ),
    );
  }
}
