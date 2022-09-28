import 'package:carrito/models/cart.dart';
import 'package:carrito/models/item_model.dart';
import 'package:carrito/redux/actions.dart';

import 'app_state.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(products: itemReducer(state.products, action));
}

Cart cartStateReducer(Cart stateCart, action) {
  return Cart(items: itemReducer(stateCart.items, action));
}

List<Item> itemReducer(List<Item> stateCart, action) {
  if (action is UpdateCartAction) {
    return []
      ..addAll(stateCart)
      ..add(Item(
          action.updatedCart.name,
          action.updatedCart.unit,
          action.updatedCart.price,
          action.updatedCart.image,
          action.updatedCart.selected));
  }

  if (action is RemoveItemAction) {
    return List.unmodifiable(List.from(stateCart)..remove(action.item));
  }
  if (action is RemoveItemsAction) {
    return List.unmodifiable([]);
  }
  return stateCart;
}



//   return state;
// }
