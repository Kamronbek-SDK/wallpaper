import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key, required this.index, required this.onClick});

  final int index;
  final void Function(int index) onClick;

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 70,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Colors.white12,
      ),
      margin: const EdgeInsets.all(16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _iconBtn(0, 'vector', () {}),
                _iconBtn(1, 'vector1', () {}),
                _iconBtn(2, 'vector2', () {}),
                _iconBtn(3, 'vector3', () {})
              ],
            ),
          ),
        ),
      ),
    );
  }

  _iconBtn(int place, String icon, VoidCallback onClick) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: onClick, icon: Image.asset('assets/icons/$icon.png')),
          const Gap(4),
          Container(
            height: 6,
            width: 6,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: place == widget.index
                    ? const Color(0xFFF222DD)
                    : Colors.transparent),
          )
        ],
      ),
    );
  }
}
