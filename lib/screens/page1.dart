import 'package:carrito/bloc/cart_bloc.dart';
import 'package:carrito/list.dart';
import 'package:carrito/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context, listen: false);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Carrito'),
          actions: [
            IconButton(onPressed: (){
              final newCart = Cart(items: [products.first]);
              cartBloc.add(ActivateCart(newCart));
            }, icon: const Icon(Icons.add)),
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () => Navigator.pushNamed(context, 'pagina2'),
            ),
          ],
        ),
        body: Center(
          child: ListView.builder(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
              shrinkWrap: true,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.blueGrey.shade200,
                  elevation: 5.0,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Image(
                          height: 80,
                          width: 80,
                          image: AssetImage(products[index].image.toString()),
                        ),
                        SizedBox(
                          width: 130,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 5.0,
                              ),
                              RichText(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Name: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].name.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Unit: ',
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].unit.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                              RichText(
                                maxLines: 1,
                                text: TextSpan(
                                    text: 'Price: ' r"$",
                                    style: TextStyle(
                                        color: Colors.blueGrey.shade800,
                                        fontSize: 16.0),
                                    children: [
                                      TextSpan(
                                          text:
                                              '${products[index].price.toString()}\n',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ]),
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              print(products[index].name);
                              cartBloc.add(AddItems(products[index]));
                            },
                            child: const Text('Add to Cart')),
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}
