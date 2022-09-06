import 'package:bloc_flutter/models/album_list.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class AlbumsRepo {
  Future<List<Album>> getAlbumList();
}

class AlbumServices implements AlbumsRepo {
  static const baseUrl = 'jsonplaceholder.typicode.com';
  static const String getAlbums = '/albums';

  @override
  Future<List<Album>> getAlbumList() async {
    Uri uri = Uri.https(baseUrl, getAlbums);
    Response response = await http.get(uri);
    List<Album> albums = albumFromJson(response.body);

    return albums;
  }
}
