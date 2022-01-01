import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_keep_clone/models/configerations.dart';
import 'package:google_keep_clone/models/page_controller.dart';

void main() {
  runApp(
    const GetMaterialApp(
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
      builder: (_controller) => screens[currentIndex],
    );
  }
}
