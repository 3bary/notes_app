import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notes_app/views/edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const EditNoteView()));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24, left: 16),
        decoration: BoxDecoration(
          color: const Color(0xffffcd7a),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: const Text(
                'Flutter Tips',
                style: TextStyle(color: Colors.black, fontSize: 24),
              ),
              trailing: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.trash,
                    color: Colors.black,
                    size: 25,
                  )),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Text(
                  'To Be A Professional Flutter Developer',
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.5), fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 24.0, top: 8.0),
              child: Text(
                'May 21 , 2022',
                style: TextStyle(color: Colors.black.withOpacity(0.5)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
