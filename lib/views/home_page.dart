import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/views/drawer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerPage(),
      backgroundColor:  themeColor,
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              decoration: BoxDecoration(
                color: const Color(0xff2C2D31),
                borderRadius: BorderRadius.circular(25),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: ListTile(
                contentPadding: const EdgeInsets.only(
                  top: 2.0,
                  left: 5.0,
                ),
                dense: true,
                leading: Builder(
                  builder: (BuildContext context) {
                    return IconButton(
                      onPressed: () => Scaffold.of(context).openDrawer(),
                      icon: Icon(
                        Icons.menu,
                        size: 25,
                        color:white,
                      ),
                    );
                  },
                ),
                title: Text(
                  "Search your notes",
                  style: GoogleFonts.recursive(
                    fontSize: 15,
                    color: white,
                  ),
                ),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        const AssetImage("assets/list.png"),
                        color: white,
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const CircleAvatar(
                      radius: 17,
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        color: const Color(0xff2E2F33),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.check_box_outlined,
                      color: white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.brush_outlined,
                      color: white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic_outlined,
                      color: white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.image_outlined,
                      color: white,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(child: Container()),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
    );
  }
}
