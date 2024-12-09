import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/data/repository/location_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    'Location Repository search test',
    () async {
      LocationRepository locationRepository = LocationRepository();
      List<Location>? results = await locationRepository.search('코엑스');
      expect(results != null, true);
      expect(results!.isNotEmpty, true);

      for (var loction in results) {
        print(loction.title);
      }
    },
  );
}
