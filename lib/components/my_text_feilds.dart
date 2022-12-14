import 'package:flutter/material.dart';

class MyTextFeild extends StatelessWidget {
  const MyTextFeild({
    Key? key,
    required this.controller,
    required this.maxLines,
    required this.minLines,
    required this.hintText,
    required this.autofocus,
    this.initialValue,
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
  final String? initialValue;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      cursorColor: Colors.amber,
      controller: controller,
      minLines: minLines,
      maxLines: maxLines,
      maxLength: maxLength,
      initialValue: initialValue,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(5),
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
