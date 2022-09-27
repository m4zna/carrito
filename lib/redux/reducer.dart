import 'package:carrito/redux/actions.dart';

import 'app_state.dart';

AppState updateCartReducer(AppState state, dynamic action) {
  if (action is UpdateCartAction) {
    action.updatedCart.selected = !action.updatedCart.selected;
  }

  return state;
}
