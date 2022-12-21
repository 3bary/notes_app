import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onTap, required this.title, this.isLoading = false});
  final VoidCallback? onTap;
  final String title;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
            color: kPrimaryColor, borderRadius: BorderRadius.circular(8.0)),
        height: 50,
        width: double.infinity,
        child: Center(
            child: isLoading ? const CircularProgressIndicator(
              color: Colors.black,
            ): Text(title,
                style: const TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold))),
      ),
    );
  }
}
