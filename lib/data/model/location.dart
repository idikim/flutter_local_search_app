//     {
//       "title": "<b>코엑스</b>",
//       "link": "http://www.coex.co.kr/",
//       "category": "문화,예술>컨벤션센터",
//       "description": "",
//       "telephone": "",
//       "address": "서울특별시 강남구 삼성동 159",
//       "roadAddress": "서울특별시 강남구 영동대로 513",
//       "mapx": "1270594274",
//       "mapy": "375116620"
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
