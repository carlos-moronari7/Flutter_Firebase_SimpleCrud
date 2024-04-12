import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void OpenNoteBox(){
    showDialog(context: context, builder: (context) => AlertDialog(
      content: TextField(),
    ));
  }

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text("Notes"),),
      floatingActionButton: FloatingActionButton(onPressed: () => {},
      child: const Icon(Icons.add),),
    );
  }
}