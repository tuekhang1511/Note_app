// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key});

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {

  final TextEditingController _title = TextEditingController();
  final TextEditingController _content = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        title: Text(
          "New note",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Colors.green[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 100),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _title,
                decoration: InputDecoration(
                  labelText: 'Title',
                  border: OutlineInputBorder(),
                  hintText: "Add title",
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _content,
                decoration: InputDecoration(
                  labelText: 'Content',
                  border: OutlineInputBorder(),
                  hintText: "Add content",
                ),
              ),
              SizedBox(height: 16),
              
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context, {"title": _title.text, "content": _content.text}
                  );
                },
                child: Text("Save"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
