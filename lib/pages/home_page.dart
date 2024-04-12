import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fb_crud/services/firestore.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  //firestore 
  final FirestoreService firestoreService = FirestoreService();

  final TextEditingController textController = TextEditingController();
  void OpenNoteBox(){
    showDialog(context: context,
     builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        ElevatedButton(onPressed: () {
          //add new note
          firestoreService.AddNote(textController.text);

          //clear text controller
          textController.clear();

          //close the box
          Navigator.pop(context);
        }, 
        child: Text("Add")),
      ],

    ));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      floatingActionButton: FloatingActionButton(onPressed: OpenNoteBox,
      child: const Icon(Icons.add),),
      body: StreamBuilder<QuerySnapshot>(stream: firestoreService.getNotesStream(),
      builder: (context, snapshot){
        if(snapshot.hasData){
          List notesList = snapshot.data!.docs;
        
        return ListView.builder(
          itemCount: notesList.length,
          itemBuilder: (context, index){
            //get individual doc
            DocumentSnapshot document = notesList[index];
            String docID = document.id;
          //get data from each doc
            Map<String,dynamic> data = 
            document.data() as Map<String, dynamic>;
            String noteText = data['note'];

            return ListTile(
              title: Text(noteText),
            );
          },);
        }else{
          return const Text("No notes");
        }
      },)
    );
  }
}