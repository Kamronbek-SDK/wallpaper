import 'package:wallpaper_app/class/model.dart';
import 'package:wallpaper_app/networking/api_service.dart';
import 'package:wallpaper_app/util/constants.dart';

class Repository {
  final _api = ApiService(buildDioClient(Constants.baseUrl));
  Future<List<Photos>> getAllImages(String query) async {
    final response = await _api.getImages(query);
    return response.photos ?? [];
  }
}