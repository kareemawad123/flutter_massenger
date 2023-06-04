import 'package:dio/dio.dart';
import 'package:first_day/model/album_model.dart';

String url = 'https://jsonplaceholder.typicode.com';
final dio = Dio();
class AlbumService{
  static Future<List<AlbumModel>> albumsData() async {
    List<AlbumModel> albums = [];
    try {
      var response = await dio.get('$url/albums');
      response.data.forEach((element) {
        AlbumModel album = AlbumModel.fromJson(element);
        albums.add(album);
      });
    } catch (e) {
      print(e);
    }
    return albums;
  }
  static Future<List<AlbumModel>> albumsDataByUserId(int id) async {
    List<AlbumModel> albums = [];
    try {
      var response = await dio.get('$url/albums?userId=$id');
      response.data.forEach((element) {
        AlbumModel album = AlbumModel.fromJson(element);
        albums.add(album);
      });
    } catch (e) {
      print(e);
    }
    return albums;
  }
}