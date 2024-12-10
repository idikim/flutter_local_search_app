import 'package:flutter/material.dart';
import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/detail_page.dart';
import 'package:flutter_local_search_app/ui/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  TextEditingController textEditingController = TextEditingController();

  void search(String text) {
    ref.read(homeViewModelProvider.notifier).search(text);
    print("search");
  }

  @override
  void dispose() {
    // 4. TextEditingController 는 반드시 사용 다하면 dispose를 호출해줘야 메모리에서 제거됨!
    // 소거해주려면 StatefulWidget 사용!
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    HomeState homeState = ref.watch(homeViewModelProvider);

    return GestureDetector(
      onTap: () {
        // 3. UX 고려하기
        // 현재 위젯(HomePage)에서 포커스를 가지고 있는 위젯이 있으면 포커스 해제해줌
        // TextField
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          // 1. TextField 구현
          title: TextField(
            maxLines: 1,
            // TextField의 값을 검색 아이콘 터치했을때에도 사용할거라 사용!
            controller: textEditingController,
            onSubmitted: search,
            // 2. TextStyle 꾸미기
            decoration: InputDecoration(
              hintText: '검색어를 입력해 주세요',
              border: MaterialStateOutlineInputBorder.resolveWith(
                (states) {
                  // MaterialStateOutlineInputBorder.resolveWith를 사용하면
                  // TextField의 값이 바뀔때마다 WidgetState enum 값을 전달해서 이 함수 실행!
                  // print(states);
                  if (states.contains(WidgetState.focused)) {
                    return OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black),
                    );
                  }
                  return OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey),
                  );
                },
              ),
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () {},
              child: Container(
                width: 50,
                height: 50,
                color: Colors.transparent,
                child: Icon(Icons.gps_fixed),
              ),
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ListView.separated(
                  itemCount: homeState.locations?.length ?? 0,
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemBuilder: (context, index) {
                    Location location = homeState.locations![index];
                    return item(location);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget item(Location location) {
    print('location: ${location.link}');
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            if (location.link.startsWith('https')) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailPage(
                      link: location.link,
                    );
                  },
                ),
              );
            }
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
                    location.title.stripHtml(),
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  Spacer(),
                  Text(
                    location.category,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  Text(
                    location.roadAddress,
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 14,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
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

//html 태그 제거
extension StringExtension on String {
  String stripHtml() => replaceAll(RegExp(r'<[^>]*>|&[^;]+;'), '');
}
