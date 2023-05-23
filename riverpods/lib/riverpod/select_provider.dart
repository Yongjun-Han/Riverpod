import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/model/shopping_item_model.dart';

final selectProvider = StateNotifierProvider<SelectNotifier, ShoppingItemModel>(
    //< notifier 의 타입 , notifier 에서 다루는 state 의 타입 >
    (ref) => SelectNotifier());

class SelectNotifier extends StateNotifier<ShoppingItemModel> {
  SelectNotifier()
      : super(
          ShoppingItemModel(
            name: "새우",
            quantity: 2,
            hasBought: false,
            isSpicy: true,
          ),
        );

  toggleHasBought() {
    state = state.copyWith(hasBought: !state.hasBought);
  }

  toggleIsSpicy() {
    state = state.copyWith(isSpicy: !state.isSpicy);
  }
}
