import 'package:flutter/material.dart';

import 'item_model.dart';

class Cart {
  final List<Item> items;

  Cart({required this.items});

  Cart copyWith({List<Item>? items}) => Cart(items: items ?? this.items);
}