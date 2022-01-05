import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/models/page_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // final logged = prefs.getString('log');
  runApp(
    const GetMaterialApp(
      // home: logged == null ? const StartingPage() : const MyApp(),
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(Controller());
    return GetBuilder<Controller>(
      id: "main",
      builder: (_) => screens[currentIndex],
    );
  }
}

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      body: Column(
        children: [
          Flexible(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/keep.png',
                height: 300,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    "Capture anything",
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      color: white,
                    ),
                  ),
                ),
                Text(
                  "Make lists, take photos, speak your mind - wherever works",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: white,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  "for you, works Keep",
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    color: white,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await signInWithGoogle();
                    Get.off(() => const MyApp());
                    // SharedPreferences prefs =
                    //     await SharedPreferences.getInstance();
                    // prefs.setString("log", "hai");
                  },
                  child: Container(
                    height: 40,
                    width: 120,
                    margin: const EdgeInsets.only(top: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blue,
                    ),
                    child: Center(
                      child: Text(
                        "Get Started",
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.black.withOpacity(.9),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
