// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_taking_app/pages/home_page.dart';
import 'package:note_taking_app/pages/new_note.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/':(context) => HomePage(),
        '/new':(context) => NewNote()
      },
      // home: HomePage(),
      theme: ThemeData(
          // brightness: Brightness.dark,
          // primarySwatch: Colors.orange,
          ),
    );
  }
}
