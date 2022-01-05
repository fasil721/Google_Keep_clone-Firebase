import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_keep_clone/models/note_model.dart';
import 'package:google_keep_clone/views/home_page.dart';
import 'package:google_keep_clone/views/reminders_page.dart';
import 'package:google_sign_in/google_sign_in.dart';

int currentIndex = 0;
final white = Colors.white.withOpacity(.8);
const themeColor = Color(0xff1F1F1F);
final _auth = FirebaseAuth.instance;
final firebaseFirestore = FirebaseFirestore.instance;
final user = _auth.currentUser;
final noteModel = NoteModel();

Future signInWithGoogle() async {
  final googleuser = await GoogleSignIn().signIn();
  final googleAuth = await googleuser!.authentication;
  final credential = GoogleAuthProvider.credential(
    idToken: googleAuth.idToken,
    accessToken: googleAuth.accessToken,
  );
  await FirebaseAuth.instance.signInWithCredential(credential);
}

Stream<List<NoteModel>> readTodos() async* {
  List<NoteModel> models = [];
  final datas = await firebaseFirestore
      .collection('users')
      .doc(user!.uid)
      .collection("notes")
      .orderBy('createdTime', descending: true)
      .get();
  for (int i = 0; i < datas.docs.length; i++) {
    models.add(noteModel.fromJson(datas.docs[i].data()));
  }
  yield models;
}

List<Map> drawerItems = [
  {"title": "Notes", 'icon': Icons.notes},
  {'title': 'Reminders', 'icon': Icons.notifications_none},
  {'title': 'Create new label', 'icon': Icons.add},
  {'title': 'Archive', 'icon': Icons.archive_outlined},
  {'title': 'Deleted', 'icon': Icons.delete_outline_outlined},
  {'title': 'Settings', 'icon': Icons.settings_outlined},
  {'title': 'Help & feedback', 'icon': Icons.info_outline},
];

const screens = [
  HomePage(),
  RemindersPage(),
  RemindersPage(),
  RemindersPage(),
  RemindersPage(),
  RemindersPage(),
  RemindersPage(),
];
