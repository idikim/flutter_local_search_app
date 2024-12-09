import 'package:flutter_local_search_app/data/model/location.dart';
import 'package:flutter_local_search_app/ui/pages/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

ProviderContainer createContainer() {
  final container = ProviderContainer();
  addTearDown(container.dispose);
  return container;
}

void main() {
  test(
    'HomeViewModel test',
    () async {
      final container = createContainer();
      HomeState homeState = container.read(homeViewModelProvider);
      expect(homeState.locations, null);
      await container.read(homeViewModelProvider.notifier).search('코엑스');
      HomeState homeStateAfterSearch = container.read(homeViewModelProvider);
      expect(homeStateAfterSearch.locations != null, true);
      expect(homeStateAfterSearch.locations!.isNotEmpty, true);
      for (var location in homeStateAfterSearch.locations!) {
        print(location.title);
      }
    },
  );
}
