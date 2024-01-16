import 'package:flutter/material.dart';
import 'package:notes_app/screens/create_note.dart';
import 'package:notes_app/widgets/note_card.dart';

import '../models/note_models.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Note> notes = List.empty(growable: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notes"),
        backgroundColor: Colors.deepPurple[900],
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context,index){
          return NoteCard(note: notes[index], idx: index, onNoteDelete:onNoteDelete ,);
        }
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple[900],
        shape: CircleBorder(),
        onPressed:(){
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=> CreateNote(onNoteCreate: onNoteCreate,)));
        },
        child: const Icon(Icons.add),
    ),
    );
  }
  void onNoteCreate(Note note){
    notes.add(note);
    setState(() {   });
  }
  void onNoteDelete(int index){
    notes.removeAt(index);
    setState(() {
      
    });
  }
}