import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/views/drawer_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer:const DrawerPage(),
      backgroundColor: const Color(0xff1F1F1F),
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
                        color: Colors.white.withOpacity(.8),
                      ),
                    );
                  },
                ),
                title: Text(
                  "Search your notes",
                  style: GoogleFonts.recursive(
                    fontSize: 15,
                    color: Colors.white.withOpacity(.8),
                  ),
                ),
                trailing: Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: ImageIcon(
                        const AssetImage("assets/list.png"),
                        color: Colors.white.withOpacity(.7),
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
    );
  }
}
