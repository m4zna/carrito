import 'package:carrito/models/item_model.dart';
import 'package:flutter/foundation.dart';

class AppState {
  final List<Item> products;

  AppState({
    required this.products,
  });

  AppState.initialState()
      : products = List.unmodifiable(<Item>[
          Item('Apple', 'Kg', 20, 'assets/images/apple.png', false),
          Item('Mango', 'Doz', 30, 'assets/images/mango.png', false),
          Item('Banana', 'Doz', 10, 'assets/images/banana.png', false),
          Item('Grapes', 'Kg', 8, 'assets/images/grapes.png', false),
          Item('Water Melon', 'Kg', 25, 'assets/images/watermelon.png', false),
          Item('Kiwi', 'Pc', 40, 'assets/images/kiwi.png', false),
          Item('Orange', 'Doz', 15, 'assets/images/orange.png', false),
          Item('Peach', 'Pc', 8, 'assets/images/peach.png', false),
          Item('Strawberry', 'Box', 12, 'assets/images/strawberry.png', false),
          Item(
              'Fruit Basket', 'Kg', 55, 'assets/images/fruitBasket.png', false),
        ]);
}
