import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.onChanged, required this.hintText, this.keyboardType, this.maxLines = 1});
  final Function(String)? onChanged;
  final String hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor),
      onChanged: onChanged,
      keyboardType: keyboardType,
      maxLines: maxLines,

      decoration: InputDecoration(
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(kPrimaryColor),
        border: buildBorder(),
        hintText: hintText,
      ),
    );
  }

  OutlineInputBorder buildBorder([color]) => OutlineInputBorder(
      borderSide: BorderSide(color: color ?? Colors.white),
      borderRadius: BorderRadius.circular(12));
}
