import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:wallpaper_app/mvvm/home_provider.dart';
import 'package:wallpaper_app/widget/image_item.dart';

import '../class/model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool _firstT = true;
  bool _searchVisib = false;
  late ScrollController _controller;

  @override
  void initState() {
    _controller = ScrollController();
    _controller.addListener((){
      if (_controller.position.userScrollDirection == ScrollDirection.forward) {
        setState(() {
          _searchVisib = true;
        });
      } else if (_controller.position.userScrollDirection == ScrollDirection.reverse) {
        setState(() {
          _searchVisib = false;
        });
      }
    });
    setState(() {});
    super.initState();
  }

  final _tabs = [
    'All',
    'New',
    'Animals',
    'Technology',
    'Nature',
    'Sport',
  ];

  @override
  Widget build(BuildContext context) {
    if(_firstT) {
      Provider.of<HomeProvider>(context, listen: false).fetchImages('all');
      _firstT = false;
    }
    final images = Provider.of<HomeProvider>(context).images;
    return DefaultTabController(
      initialIndex: 0,
      length: 6,
      child: Scaffold(
        appBar: TabBar(
          onTap: (index) {
            Provider.of<HomeProvider>(context, listen: false).fetchImages(_tabs[index].toLowerCase());
          },
          indicatorWeight: 1,
          indicatorColor: const Color(0xFFF222DD),
          isScrollable: true,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey,
          tabAlignment: TabAlignment.start,
          tabs: const [
            Tab(text: "All"),
            Tab(text: "New"),
            Tab(text: "Animals"),
            Tab(text: "Technology"),
            Tab(text: "Nature"),
            Tab(text: "Sport")
          ],
        ),
        body: images.isEmpty ? Center(
          child: LoadingAnimationWidget.inkDrop(color: Colors.white, size: 35),
        ) : body(images),
      ),
    );
  }
  body(List<Photos> images) {
    return Stack(
      children: [
        GridView.builder(
          controller: _controller,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 4,
              crossAxisSpacing: 4,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) => ImageItem(photo: images[index], onClick: (){})
        ),
        Positioned(
          top: 12,
          left: 12,
          right: 12,
          child: _searchVisib ? SearchBar(
            elevation: MaterialStateProperty.all(0),
            hintText: 'Search photos',
          ).animate().fade().slideY().slideX() : Container()
        )
      ],
    );
  }
}
