import 'dart:convert';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonString = """
    {
      "title": "코엑스",
      "link": "http://www.coex.co.kr/",
      "category": "문화,예술>컨벤션센터",
      "description": "",
      "telephone": "",
      "address": "서울특별시 강남구 삼성동 159",
      "roadAddress": "서울특별시 강남구 영동대로 513",
      "mapx": "1270594274",
      "mapy": "375116620"
    }
""";

  test(
    'Location model convert test',
    () {
      Map<String, dynamic> map = jsonDecode(jsonString);
      Location location = Location.fromJson(map);

      expect(location.roadAddress, "서울특별시 강남구 영동대로 513");
    },
  );
}
