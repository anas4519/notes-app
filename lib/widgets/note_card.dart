import 'package:flutter/material.dart';
import 'package:notes_app/screens/note_view.dart';

import '../models/note_models.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key,required this.note, required this.idx, required this.onNoteDelete});
  final Note note;
  final int idx;
  final Function(int) onNoteDelete;
  
  

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NoteView(note: note, idx: idx, onNoteDelete: onNoteDelete,)));
      },
      child: Card(
              child: Padding(padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    note.title,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    note.body,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              ),
               
            ),
    );
  }
}