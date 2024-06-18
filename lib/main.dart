import 'package:flutter/material.dart';
import 'package:wallpaper_app/page/main_page.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF774bfe), brightness: Brightness.dark)
      ),
      home: MainPage(),
    );
  }
}
