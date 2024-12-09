import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:http/http.dart';

class LocationRepository {
  Future<List<Location>?> search(String query) async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load(fileName: 'assets/.env');
    String? naverClientSecret = dotenv.env['X-Naver-Client-Secret'];

    try {
      Client client = Client();
      Response response = await client.get(
          Uri.parse(
              'https://openapi.naver.com/v1/search/local.json?query=$query'),
          headers: {
            'X-Naver-Client-Id': 'FQPjDc8ixaHMsuwhHNqo',
            'X-Naver-Client-Secret': naverClientSecret!
          });

      if (response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(response.body);
        final items = List.from(map['items']);
        //
        final iterable = items.map((e) => Location.fromJson(e));
        final list = iterable.toList();
        return list;
      } else {
        throw Exception(response.statusCode);
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
