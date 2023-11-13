import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:karateclash/views/auth_pages/auth_page_switcher.dart';
import 'package:karateclash/views/dashboard.dart';
import 'package:karateclash/views/event_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Eczar',
        useMaterial3: true,
      ),
      home: const AuthPageSwitcher(),
    );
  }
}
