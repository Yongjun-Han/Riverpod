import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/model/shopping_item_model.dart';
import 'package:riverpods/riverpod/state_notifier_provider.dart';

final filteredShoppingLisProvider = Provider<List<ShoppingItemModel>>((ref) {
  final filterState = ref.watch(filterProvider);
  final shoppingListState = ref.watch(shoppingListProvider);

  if (filterState == FilterState.all) {
    return shoppingListState;
  }

  return shoppingListState
      .where((element) =>
          filterState == FilterState.spciy ? element.isSpicy : !element.isSpicy)
      .toList();
});

enum FilterState {
  notSpicy,
  spciy,
  all,
}

final filterProvider = StateProvider<FilterState>((ref) => FilterState.all);
