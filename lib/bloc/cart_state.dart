part of 'cart_bloc.dart';

@immutable
abstract class CartState {
  final bool existCart;
  final Cart? cart;

  const CartState({this.existCart = false, this.cart});
}

class CartInitialState extends CartState {
  const CartInitialState() : super(existCart: false, cart: null);
}

class CartSetState extends CartState {
  final Cart newCart;

  const CartSetState(this.newCart) : super(existCart: true, cart: newCart);
}
