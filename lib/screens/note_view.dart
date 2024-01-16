import 'package:flutter/material.dart';

import '../models/note_models.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key, required this.note, required this.idx, required this.onNoteDelete});

  final Note note;
  final int idx;
  final Function(int) onNoteDelete;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: const Text("Note View"),
        backgroundColor: Colors.deepPurple[900],
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return AlertDialog(
                title: Text("Delete note?"),
                content: Text("Note '${note.title}' will be deleted"),
                actions: [
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                    onNoteDelete(idx);
                    Navigator.of(context).pop(); 

                  }, child: const Text("DELETE"),
                  ),
                  TextButton(onPressed: (){
                    Navigator.of(context).pop();
                  }, child: const Text("CANCEL"),
                  ),
                ],
              );
            }
            );
          }, icon: Icon(Icons.delete),)
        ],
        
      ),
      body: Padding(padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            note.title, style: const TextStyle(
              fontSize: 26
            ),
          ),
          const SizedBox(height: 10,),
          Text(
            note.body, style: const TextStyle(
              fontSize: 18
            ),
          ),

        ]),
      ),
      
    );
  }
}