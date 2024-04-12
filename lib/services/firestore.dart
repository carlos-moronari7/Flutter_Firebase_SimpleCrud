import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService{
  final CollectionReference notes = FirebaseFirestore.instance.collection('notes');
//add note
  Future<void> AddNote (String note){
    return notes.add({
      'note':note,
      'timestamp':Timestamp.now(),
    });
  }

  //read notes
  Stream<QuerySnapshot> getNotesStream(){
    final notesStream = 
    notes.orderBy('timestamp',descending: true).snapshots();
      return notesStream;
  }

  //update Notes

  Future<void> UpdateNote(String docID, String newNote){
    return notes.doc(docID).update({
      'note':newNote,
      'timestamp':Timestamp.now(),
      }
    );

  }
}