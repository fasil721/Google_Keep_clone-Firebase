import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';

class CreateNote extends StatelessWidget {
  CreateNote({Key? key}) : super(key: key);
  final textEditController = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                child: Text(
                  "Edited 5:20 pm",
                  style: GoogleFonts.sansita(
                    fontSize: 12,
                    color: white,
                  ),
                ),
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
