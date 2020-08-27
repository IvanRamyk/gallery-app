import 'dart:convert';

import 'package:galleryapp/keys.dart';
import 'package:galleryapp/models/image.dart';
import 'package:http/http.dart' as http;

class UnsplashImageProvider {

  static Future<List> loadImages() async {
    String url = 'https://api.unsplash.com/photos';
    var response = await http.get(url + '/?client_id=${Keys.UNSPLASH_API_CLIENT_ID}');

    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((data) => new UnsplashImage.fromJson(data))
          .toList();

    } else {
      throw Exception('Failed to load images');
    }
  }
}