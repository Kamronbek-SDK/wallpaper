import 'package:flutter/material.dart';
import 'package:wallpaper_app/class/model.dart';

class ImageItem extends StatelessWidget {
  const ImageItem({super.key, required this.photo, required this.onClick});

  final Photos photo;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(6),
      onTap: onClick,
      child: Ink(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
        ),
        child: FadeInImage(
          placeholder: const AssetImage('assets/img/holder.jpg'),
          image: NetworkImage(photo.src?.medium ?? ''),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
