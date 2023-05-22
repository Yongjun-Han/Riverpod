class ShoppingItemModel {
  //이름
  final String name;
  //수량
  final int quantity;
  //구매여부, 매움여부
  final bool hasBought, isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });
}
