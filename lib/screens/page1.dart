import 'package:carrito/models/item_model.dart';
import 'package:carrito/redux/app_state.dart';
import 'package:carrito/screens/page2.dart';
import 'package:carrito/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:carrito/redux/reducer.dart';

class Page1Screen extends StatelessWidget {
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, 'pagina2'),
          )
        ],
      ),
      body: StoreConnector<AppState, List<Item>>(
        converter: (store) => store.state.products,
        builder: (context, List<Item> allProducts) => SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...allProducts
                    .map(
                      (product) => ProductWidget(
                        product: product,
                      ),
                    )
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ViewModel {
  final List<Item> items;
  final Function(String) onAddItem;
  final Function(Item) onRemoveItem;
  final Function() onRemoveItems;

  ViewModel({
    required this.items,
    required this.onAddItem,
    required this.onRemoveItem,
    required this.onRemoveItems,
  });
}
