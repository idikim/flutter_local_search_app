import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/ui/pages/detail/detail_page.dart';

class HomeListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: 50,
        separatorBuilder: (context, index) => SizedBox(
          height: 20,
        ),
        itemBuilder: (context, index) {
          return item();
        },
      ),
    );
  }

  Widget item() {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailPage();
                },
              ),
            );
          },
          child: SizedBox(
            height: 120,
            width: double.infinity,
            child: Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.black12,
                  )),
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '삼성1동 주민센터',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '공공,사회기관>행정복지센터',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    '서울특별시 강남구 봉은사로 616 삼성1동 주민센터',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
