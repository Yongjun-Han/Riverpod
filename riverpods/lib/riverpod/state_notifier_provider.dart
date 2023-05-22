
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpods/model/shopping_item_model.dart';

final shoppingListProvider =
    StateNotifierProvider<ShoppingListNotifier, List<ShoppingItemModel>>(
        (ref) => ShoppingListNotifier());

class ShoppingListNotifier extends StateNotifier<List<ShoppingItemModel>> {
  ShoppingListNotifier()
      : super(
          //처음에 어떤값으로 상태를 초기화 할지의 값
          [
            ShoppingItemModel(
              name: "김치",
              quantity: 3,
              hasBought: false,
              isSpicy: true,
            ),
            ShoppingItemModel(
              name: "계란",
              quantity: 30,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "삼겹살",
              quantity: 4,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "복숭아",
              quantity: 21,
              hasBought: false,
              isSpicy: false,
            ),
            ShoppingItemModel(
              name: "불닭볶음면",
              quantity: 2,
              hasBought: false,
              isSpicy: true,
            )
          ],
        );

  void toggleHasBought({required String name}) {
    state = state
        //state : stateNotifier 가 제공하는 기본 값으로 super constructor 의 첫번째 값으로 초기화가 된다
        .map((e) => e.name == name
            ? ShoppingItemModel(
                name: e.name,
                quantity: e.quantity,
                hasBought: !e.hasBought,
                isSpicy: e.isSpicy,
              )
            : e)
        .toList();
  }
}
