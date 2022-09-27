part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class ActivateCart extends CartEvent {
  final Cart cart;

  ActivateCart(this.cart);
}

class AddItems extends CartEvent {
  final Item item;

  AddItems(this.item);
}

class DeleteCart extends CartEvent{

}
