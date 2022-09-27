class Item {
  final String name;
  final String unit;
  final int price;
  final String image;
  late final bool selected;

  Item(
      {required this.name,
      required this.unit,
      required this.price,
      required this.image,
      required this.selected});

  Map toJson() {
    return {
      'name': name,
      'unit': unit,
      'price': price,
      'image': image,
    };
  }
}
