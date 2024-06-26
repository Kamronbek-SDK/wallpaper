import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:wallpaper_app/page/home_page.dart';
import 'package:wallpaper_app/page/liked_page.dart';
import 'package:wallpaper_app/widget/bottom_nav.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  int _currentIndex = 0;

  final pages = [
    const HomePage(),
    const LikedPage(),
    Container(),
    Container(),
  ];

  final _titles = [
    "Home",
    "Popular",
    "Refresh",
    "Favorite"
  ];

  @override
  Widget build(BuildContext context) {
      return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_currentIndex]),
        actions: [
         AnimatedOpacity(
             opacity: _currentIndex == 0 ? 1 : 0,
             duration: const Duration(milliseconds: 500),
           child: IconButton(
             onPressed: (){},
             icon: const Icon(CupertinoIcons.search),
           ),
         )
        ],
      ),
      drawer: Drawer(
        backgroundColor: const Color(0xFF152C3F),
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName:  null,
              accountEmail: null,
              decoration: const BoxDecoration(
                color: Color(0xFF152C3F),
              ),
              otherAccountsPicturesSize: const Size(180, 70),
              otherAccountsPictures: const [
                Center(
                    child: Text('4K Full Wallpaper', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
                )
              ],
              currentAccountPicture: Image.asset('assets/img/group.png', fit: BoxFit.cover,),
            ),
           ListTile(
             title: const Text('History'),
             leading: Image.asset('assets/drawer/frame0.png'),
           ),
            ListTile(
              title: const Text('About'),
              leading: Image.asset('assets/drawer/frame1.png'),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          pages[_currentIndex],
          Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: BottomNav(index: _currentIndex, onClick: (index) => setState(() {_currentIndex = index;})),
          )
        ],
      ),
    );
  }
}