import 'package:carrito/bloc/cart_bloc.dart';
import 'package:carrito/screens/page1.dart';
import 'package:carrito/screens/page2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => CartBloc())],
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
