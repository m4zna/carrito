import 'package:bloc/bloc.dart';
import 'package:carrito/models/cart.dart';
import 'package:carrito/models/item_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartInitialState()) {
    on<ActivateCart>((event, emit) {
      emit(CartSetState(event.cart));
    });

    on<DeleteCart>((event, emit) {
      emit(CartInitialState());
    });

    on<AddItems>((event, emit) {
      if (!state.existCart) return;

      final items = [...state.cart!.items, event.item];
      emit(CartSetState(state.cart!.copyWith(items: items)));
    });
  }
}
