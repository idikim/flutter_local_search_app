// {
//       "title": "삼성1동 주민센터",
//       "link": "http://www.gangnam.go.kr/center/main.do?office=3220047",
//       "category": "공공,사회기관>행정복지센터",
//       "description": "",
//       "telephone": "",
//       "address": "서울특별시 강남구 삼성1동 161-2",
//       "roadAddress": "서울특별시 강남구 봉은사로 616 삼성1동 주민센터",
//       "mapx": "1270625320",
//       "mapy": "375144424"
//     }

class Location {
  final String title;
  final String link;
  final String category;
  final String roadAddress;

  Location({
    required this.title,
    required this.link,
    required this.category,
    required this.roadAddress,
  });

  Location.fromJson(Map<String, dynamic> json)
      : this(
          title: json["title"],
          link: json["link"],
          category: json["category"],
          roadAddress: json["roadAddress"],
        );

  Map<String, dynamic> toJson() => {
        "title": title,
        "link": link,
        "category": category,
        "roadAddress": roadAddress,
      };
}
