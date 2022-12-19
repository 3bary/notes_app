import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children:  const [
          CustomAppBar(title: 'Edit Note', icon: FontAwesomeIcons.check,),
          SizedBox(height: 50,),
          CustomTextField(hintText: 'Title',),
          SizedBox(height: 16,),
          CustomTextField(hintText: 'content',maxLines: 5,),
        ],
      ),
    );
  }
}
