import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/page/main_page.dart';

import 'mvvm/home_provider.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => HomeProvider())
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF774bfe), brightness: Brightness.dark)
        ),
        home: const MainPage(),
      ),
    );
  }
}
