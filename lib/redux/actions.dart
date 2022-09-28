import 'package:carrito/models/item_model.dart';

class UpdateCartAction {
  final Item updatedCart;

  UpdateCartAction(this.updatedCart);
}

class RemoveItemAction {
  final Item item;
  RemoveItemAction(this.item);
}

class RemoveItemsAction {}
