import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_keep_clone/models/page_controller.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/models/note_model.dart';

// ignore: must_be_immutable
class CreateNote extends StatefulWidget {
  CreateNote({Key? key, this.model}) : super(key: key);
  NoteModel? model;
  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  final _controller = Get.find<Controller>();
  TextEditingController? titleEditController;
  TextEditingController? noteEditController;
  final _auth = FirebaseAuth.instance;
  final firebaseFirestore = FirebaseFirestore.instance;
  final noteModel = NoteModel();

  @override
  void dispose() {
    postDetailsToFirestore();
    super.dispose();
  }

  postDetailsToFirestore() async {
    if (widget.model != null) {
      //updating the notes
      final user = _auth.currentUser;
      DateTime date = DateTime.now();
      if (titleEditController!.text.isNotEmpty ||
          noteEditController!.text.isNotEmpty) {
        noteModel.createdTime = DateFormat("dd LLL yyyy HH:mm a").format(date);
        noteModel.title = titleEditController!.text;
        noteModel.note = noteEditController!.text;
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection("notes")
            .doc(widget.model!.uid)
            .update(noteModel.toJson());
        _controller.update(["view"]);
      }
    } else {
      //creating the new notes
      final user = _auth.currentUser;
      DateTime date = DateTime.now();
      if (titleEditController!.text.isNotEmpty ||
          noteEditController!.text.isNotEmpty) {
        noteModel.createdTime = DateFormat("dd LLL yyyy HH:mm a").format(date);
        noteModel.title = titleEditController!.text;
        noteModel.note = noteEditController!.text;
        await firebaseFirestore
            .collection("users")
            .doc(user!.uid)
            .collection("notes")
            .add(noteModel.toJson());
        _controller.update(["view"]);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    titleEditController = TextEditingController(
      text: widget.model != null ? widget.model!.title : "",
    );
    noteEditController = TextEditingController(
      text: widget.model != null ? widget.model!.note : "",
    );
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.push_pin_outlined,
              color: white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notification_add_outlined,
              color: white,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.archive_outlined,
              color: white,
            ),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: white,
          ),
        ),
      ),
      body: ListView(
        children: [
          const Hero(tag: "icn", child: SizedBox()),
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: TextField(
              cursorWidth: 1,
              controller: titleEditController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              cursorHeight: 20,
              cursorColor: white,
              style: GoogleFonts.roboto(
                fontSize: 20,
                color: white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Title",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 22,
                  color: white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextField(
              controller: noteEditController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              minLines: 1,
              cursorWidth: 1,
              cursorHeight: 20,
              cursorColor: white,
              style: GoogleFonts.roboto(
                fontSize: 18,
                color: white,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                hintText: "Note",
                hintStyle: GoogleFonts.roboto(
                  fontSize: 17,
                  color: white,
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 65,
        child: Row(
          children: [
            Expanded(
                child: Row(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.add_box_outlined,
                    color: white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.color_lens_outlined,
                    color: white,
                  ),
                ),
              ],
            )),
            Expanded(
              child: Align(
                alignment: const Alignment(0, 0),
                child: widget.model != null
                    ? Text(
                        "Edited " + widget.model!.createdTime!,
                        style: GoogleFonts.sansita(
                          fontSize: 12,
                          color: white,
                        ),
                      )
                    : const SizedBox(),
              ),
            ),
            Expanded(
              child: Align(
                alignment: const Alignment(1, 0),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.more_vert_outlined,
                    color: white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
