import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/views/drawer_page.dart';

class RemindersPage extends StatelessWidget {
  const RemindersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      backgroundColor: themeColor,
      appBar: AppBar(
        toolbarHeight: 60,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) {
            return IconButton(
              onPressed: () => Scaffold.of(context).openDrawer(),
              icon: Icon(
                Icons.menu,
                size: 25,
                color: Colors.white.withOpacity(.8),
              ),
            );
          },
        ),
        title: Text(
          "Reminders",
          style: GoogleFonts.recursive(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: Colors.white.withOpacity(.8),
          ),
        ),
        actions: [
          IconButton(
            padding: const EdgeInsets.all(0.0),
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: 25,
              color: Colors.white.withOpacity(.8),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: ImageIcon(
              const AssetImage("assets/list.png"),
              color: white,
            ),
          ),
          const SizedBox(width: 3),
        ],
      ),
    );
  }
}
