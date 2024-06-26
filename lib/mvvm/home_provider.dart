import 'package:flutter/cupertino.dart';
import 'package:wallpaper_app/class/model.dart';
import 'package:wallpaper_app/repository/repository.dart';

class HomeProvider with ChangeNotifier {
  final List<Photos> images = [];
  final _repo = Repository();

  void fetchImages(query) async {
    images.clear();
    notifyListeners();
    await Future.delayed(const Duration(milliseconds: 650));
    final list = await _repo.getAllImages(query);
    images.addAll(list);
    notifyListeners();
  }
}