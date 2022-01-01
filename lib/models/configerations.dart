import 'package:flutter/material.dart';
import 'package:google_keep_clone/views/home_page.dart';

List<Map> drawerItems = [
  {"title": "Notes", 'icon': Icons.notes},
  {'title': 'Reminders', 'icon': Icons.notifications_none},
  {'title': 'Create new label', 'icon': Icons.add},
  {'title': 'Archive', 'icon': Icons.archive_outlined},
  {'title': 'Deleted', 'icon': Icons.delete_outline_outlined},
  {'title': 'Settings', 'icon': Icons.settings_outlined},
  {'title': 'Help & feedback', 'icon': Icons.info_outline},
];
int currentIndex = 0;
List Screens = [
  HomePage(),
  Container(),
  Container(),
  Container(),
  Container(),
  Container(),
  Container(),
];
