import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
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
            SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: 6,
                  itemBuilder: (context, index) => ListTile(
                    leading: Image.asset('assets/drawer/frame$index.png', ),
                  ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNav(index: _currentIndex, onClick: (index) => setState(() {_currentIndex = index;})),
    );
  }
}