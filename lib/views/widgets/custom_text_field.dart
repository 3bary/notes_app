import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {super.key, this.hintText, this.keyboardType, this.maxLines = 1, this.onSaved, this.onchange, this.initialValue});
  final Function(String?)? onSaved;
  final Function(String)? onchange;
  final String? hintText;
  final TextInputType? keyboardType;
  final int maxLines;
  final String? initialValue;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: kPrimaryColor,
      style: const TextStyle(color: kPrimaryColor),
      onChanged: onchange,
      onSaved: onSaved,
      validator: (value){
        if (value?.isEmpty ?? true) {
          return 'Field is required';
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      maxLines: maxLines,
      initialValue: initialValue,
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
