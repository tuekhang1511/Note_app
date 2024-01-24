// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note.dart';
import 'package:note_taking_app/pages/new_note.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List note = [
    ["1", "I love coding"],
    ["2", "I love Azure"],
    ["3", "I love LOL"],
    ["4", "I love PUBG"],
  ];

  void noteSelected(int index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.amber,
          content: Container(
            height: 100,
            width: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    note[index][1],
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        note.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Delete",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red[800],
                      ),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> navigateNewNote(BuildContext context) async {
    final Map<String, String>? newNote = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewNote()),
    );

    if (newNote != null) {
      setState(() {
        note.add([newNote['title'], newNote['content']]);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[200],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blue[200],
        leading: Icon(Icons.menu_rounded),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            navigateNewNote(context);
          },
          child: Icon(Icons.add_box_rounded)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 200),
            child: Container(
                height: 800,
                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: note.length,
                    itemBuilder: (context, index) {
                      return Note(
                        title: note[index][0],
                        content: note[index][1],
                        onTap: () => noteSelected(index)
                      );
                    })),
          ),
        ]),
      ),
    );
  }
}
