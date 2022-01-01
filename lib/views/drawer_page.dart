import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/models/page_controller.dart';

class DrawerPage extends StatelessWidget {
  DrawerPage({Key? key}) : super(key: key);
  final _controller = Get.find<Controller>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: const Color(0xff1F1F1F),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              child: Text(
                "Google Keep",
                style: GoogleFonts.lato(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(.8),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: drawerItems.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: ListTile(
                      tileColor: currentIndex == index
                          ? const Color(0xff454746)
                          : Colors.transparent,
                      onTap: () {
                        Navigator.of(context).pop();
                        if (index != currentIndex) {
                          currentIndex = index;
                          _controller.update(["main"]);
                        }
                      },
                      contentPadding: const EdgeInsets.only(
                        top: 0.0,
                        left: 15.0,
                      ),
                      dense: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(25),
                          bottomRight: Radius.circular(25),
                        ),
                      ),
                      leading: Icon(
                        drawerItems[index]["icon"],
                        color: Colors.white.withOpacity(.8),
                      ),
                      title: Text(
                        drawerItems[index]["title"],
                        style: GoogleFonts.recursive(
                          fontSize: 15,
                          color: Colors.white.withOpacity(.8),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    const SizedBox(
                  height: 5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
