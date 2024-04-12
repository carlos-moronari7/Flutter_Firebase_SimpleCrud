import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController textController = TextEditingController();
  void OpenNoteBox(){
    showDialog(context: context,
     builder: (context) => AlertDialog(
      content: TextField(
        controller: textController,
      ),
      actions: [
        ElevatedButton(onPressed: () {}, 
        child: Text("Add")),
      ],

    ));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      floatingActionButton: FloatingActionButton(onPressed: OpenNoteBox,
      child: const Icon(Icons.add),),
    );
  }
}