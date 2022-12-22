import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key, required this.title, required this.icon,required this.onPressed}) : super(key: key);
  final String title;
  final IconData icon;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 28,),
        ),
        const Spacer(),
        CustomIcon(onPressed: onPressed, icon: icon,),
      ],
    );
  }
}
