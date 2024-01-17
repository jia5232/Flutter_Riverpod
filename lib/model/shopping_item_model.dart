class ShoppingItemModel {
  // 이름
  final String name;
  // 갯수
  final int quantity;
  // 구매했는지
  final bool hasBought;
  // 매운지
  final bool isSpicy;

  ShoppingItemModel({
    required this.name,
    required this.quantity,
    required this.hasBought,
    required this.isSpicy,
  });

  ShoppingItemModel copyWith({ //선택한 값만 선택적으로 변경할 수 있게 메소드를 만든다.
    String? name,
    int? quantity,
    bool? hasBought,
    bool? isSpicy,
  }) {
    return ShoppingItemModel(
      name: name ?? this.name, //name이 null일때는 this.name, null이 아닐때는 입력받은 name이 된다.
      quantity: quantity ?? this.quantity,
      hasBought: hasBought ?? this.hasBought,
      isSpicy: isSpicy ?? this.isSpicy,
    );
  }
}
