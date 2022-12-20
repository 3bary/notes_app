import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

import 'custom_button.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: AddNoteForm(),
      ),
    );
  }
}

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;
  String? title,subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children:  [
          const SizedBox(height: 32,),
          CustomTextField(
            onSaved: (value){
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(height: 16,),
          CustomTextField(
            onSaved: (value){
              subTitle = value;
            },
            hintText: 'content',maxLines: 5,
          ),
          const SizedBox(height: 48,),
          CustomButton(
            onTap: (){
              if(formKey.currentState!.validate()){
                formKey.currentState!.save();
              }else{
                autoValidateMode = AutovalidateMode.always;
              }
            },
            title: 'Add',
          ),
          const SizedBox(height: 16,)
        ],
      ),
    );
  }
}
