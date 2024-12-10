import 'dart:convert';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  String jsonString = """
{
      "title": "삼성1동 주민센터",
      "link": "http://www.gangnam.go.kr/center/main.do?office=3220047",
      "category": "공공,사회기관>행정복지센터",
      "description": "",
      "telephone": "",
      "address": "서울특별시 강남구 삼성1동 161-2",
      "roadAddress": "서울특별시 강남구 봉은사로 616 삼성1동 주민센터",
      "mapx": "1270625320",
      "mapy": "375144424"
    }
""";

  test(
    'Location model convert test',
    () {
      Map<String, dynamic> map = jsonDecode(jsonString);
      Location location = Location.fromJson(map);

      expect(location.roadAddress, "서울특별시 강남구 봉은사로 616 삼성1동 주민센터");
      print(location.title);
    },
  );
}
