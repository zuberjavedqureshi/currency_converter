import 'package:currency_converter_app/constants.dart';
import 'package:flutter/material.dart';

class AmonutTextField extends StatelessWidget {
  const AmonutTextField({
    super.key,
    required this.hintTextString,
    required this.textEditingController,
  });
  final String hintTextString;
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          fillColor: kGrayColor,
          hintText: hintTextString),
    );
  }
}
