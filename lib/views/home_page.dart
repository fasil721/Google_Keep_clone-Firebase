import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/main.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/models/page_controller.dart';
import 'package:google_keep_clone/views/create_note_page.dart';
import 'package:google_keep_clone/views/drawer_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text("something went wrong"),
          );
        } else if (snapshot.hasData) {
          User user = snapshot.data as User;
          return Scaffold(
            extendBody: true,
            drawer: DrawerPage(),
            backgroundColor: themeColor,
            body: SafeArea(
              child: Stack(
                children: [
                  ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: const Color(0xff2C2D31),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 5),
                        child: ListTile(
                          contentPadding: const EdgeInsets.only(
                            top: 2.0,
                            left: 5.0,
                          ),
                          dense: true,
                          leading: Builder(
                            builder: (BuildContext context) {
                              return IconButton(
                                onPressed: () =>
                                    Scaffold.of(context).openDrawer(),
                                icon: Icon(
                                  Icons.menu,
                                  size: 25,
                                  color: white,
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
                                onPressed: () async {
                                  // await googleuser.signOut().catchError((err) {
                                  //   print(err);
                                  // });
                                  // SharedPreferences prefs =
                                  //     await SharedPreferences.getInstance();
                                  // prefs.remove("log");
                                },
                                icon: ImageIcon(
                                  const AssetImage("assets/list.png"),
                                  color: white,
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              GetBuilder<Controller>(
                                id: "data",
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () async {},
                                    child: CircleAvatar(
                                      backgroundImage:
                                          NetworkImage(user.photoURL!),
                                      radius: 17,
                                    ),
                                  );
                                },
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
                          onPressed: () {
                            print(user.email);
                          },
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
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Stack(
              children: [
                Positioned(
                  bottom: 35,
                  right: 28,
                  child: Container(
                    height: 25,
                    width: 74,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                      color: themeColor,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 43,
                  right: 35,
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => CreateNote());
                    },
                    child: Hero(
                      tag: "icn",
                      child: Container(
                        height: 60,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: const Color(0xff2E2F33),
                        ),
                        child: Center(
                          child: Image.asset(
                            "assets/add.png",
                            height: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const StartingPage();
        }
      },
    );
  }
}
