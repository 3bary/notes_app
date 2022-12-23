import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';

import '../../constants.dart';
import 'color_item.dart';

class EditViewColorsList extends StatefulWidget {
  const EditViewColorsList({Key? key, required this.noteModel}) : super(key: key);
  final NoteModel noteModel;
  @override
  State<EditViewColorsList> createState() => _EditViewColorsListState();
}

class _EditViewColorsListState extends State<EditViewColorsList> {
  late int currentIndex;
  @override
  void initState() {
    currentIndex = kColors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child:
      ListView.builder(
        itemCount: kColors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4.0),
          child: GestureDetector(
            onTap: (){
              currentIndex = index;
              widget.noteModel.color = kColors[index].value;
              setState(() {

              });
            },
            child: ColorItem(
              isActive: currentIndex == index, color: kColors[index],
            ),
          ),
        ),
      ),
    );
  }
}
