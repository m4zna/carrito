import 'package:carrito/screens/page1.dart';
import 'package:carrito/screens/page2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: 'pagina1',
      routes: {
        'pagina1' : (_)=>Page1Screen(),
        'pagina2' : (_)=>Page2Screen(),
      },
    );
  }
}

