import 'package:carrito/models/item_model.dart';
import 'package:carrito/redux/actions.dart';
import 'package:carrito/redux/app_state.dart';
import 'package:carrito/redux/reducer.dart';
import 'package:carrito/screens/page1.dart';
import 'package:carrito/screens/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Store<AppState> store =
        Store<AppState>(appStateReducer, initialState: AppState.initialState());

    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        initialRoute: 'pagina1',
        routes: {
          'pagina1': (_) => Page1Screen(),
          'pagina2': (_) => Page2Screen(),
        },
      ),
    );
  }
}
