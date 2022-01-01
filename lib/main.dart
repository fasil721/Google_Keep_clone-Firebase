import 'package:flutter/material.dart';
import 'package:google_keep_clone/models/configerations.dart';

void main() {
  runApp(
    const 
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Screens[currentIndex];
  }
}
