import 'package:flutter/material.dart';
import 'package:wallpaper_app/widget/bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNav(index: _currentIndex, onClick: (index) => setState(() {_currentIndex = index;})),
    );
  }
}
