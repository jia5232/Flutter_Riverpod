import 'package:advanced_state/model/shopping_item_model.dart';
import 'package:advanced_state/riverpod/state_notifier_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// provider 안의 provider! (여러개의 provider)
// 여러개의 provider들을 하나의 새로운 provider안에 집어넣고 그 안에서 로직을 작성해도
// 기존의 provider들의 로직과 상태가 그대로 유지된다!
final filteredShoppingListProvider = Provider<List<ShoppingItemModel>>(
  (ref) {
    final filterState = ref.watch(filterProvider);
    final shoppingListState = ref.watch(shoppingListProvider);
    //ref.watch이므로 값들이 변경이 될때마다 Provider가 다시 실행되면서, build함수가 다시 실행되게 된다.

    if (filterState == FilterState.all) {
      return shoppingListState;
    }

    return shoppingListState
        .where((element) => filterState == FilterState.spicy
            ? element.isSpicy
            : !element.isSpicy)
        .toList();
  },
);

enum FilterState { notSpicy, spicy, all }

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
