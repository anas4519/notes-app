import 'package:flutter/material.dart';

import '../models/note_models.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({super.key, required this.onNoteCreate});
  final Function(Note) onNoteCreate;

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Note"),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              style: const TextStyle(
                fontSize: 38
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title"
              ),
            ),
            const SizedBox(height: 10,),
            TextFormField(
              controller: bodyController,
              style: const TextStyle(
                fontSize: 22
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Start Typing"
              ),
      
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[900],
        onPressed: () {
          if(titleController.text.isEmpty){
            return;
          }
          if(bodyController.text.isEmpty){
            return;
          }
          final note = Note(body: bodyController.text,
          title: titleController.text);
          widget.onNoteCreate(note);
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.save_rounded),
      ),
    );
  }
}