import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_list_view.dart';
import 'package:notes_app/views/widgets/custom_button.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

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
  String? title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: autoValidateMode,
      key: formKey,
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          CustomTextField(
            onSaved: (value) {
              title = value;
            },
            hintText: 'Title',
          ),
          const SizedBox(
            height: 16,
          ),
          CustomTextField(
            onSaved: (value) {
              subTitle = value;
            },
            hintText: 'content',
            maxLines: 5,
          ),
          const SizedBox(height: 16,),
          const ColorsListView(),
          const SizedBox(
            height: 36,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onTap: () {
                  addNote(context);
                },
                title: 'Add',
              );
            },
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  void addNote(BuildContext context) {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var noteModel = NoteModel(
          title: title!,
          subTitle: subTitle!,
          date: DateFormat.yMMMMEEEEd().format(DateTime.now()),
          color: Colors.cyan.value
      );
      BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
    } else {
      autoValidateMode = AutovalidateMode.always;
    }
  }
}
