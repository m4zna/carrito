import 'package:carrito/models/item_model.dart';
import 'package:carrito/redux/actions.dart';
import 'package:carrito/redux/app_state.dart';
import 'package:carrito/widgets/product_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class Page2Screen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2Screen'),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              StoreProvider.of<AppState>(context).dispatch(RemoveItemsAction());
            },
          )
        ],
      ),

      body: SafeArea(
        child: Container(
          child: StoreConnector<AppState, List<Item>>(
              converter: (store) => store.state.products,
              builder: (context, List<Item> allProduct) => Container(
                    // height: screenHeight,
                    child: Visibility(
                      visible: allProduct.isNotEmpty,
                      child: Container(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int idx) {
                          final item = allProduct[idx];
                          return Container(
                            margin: EdgeInsets.only(
                                top: 20, bottom: 20, left: 20, right: 20),
                            height: 80,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image(
                                      height: 80,
                                      width: 80,
                                      image: AssetImage(item!.image.toString()),
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('${item.name}'),
                                  ],
                                ),
                                Center(
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            primary: Colors.red),
                                        onPressed: () {
                                          StoreProvider.of<AppState>(context)
                                              .dispatch(
                                                  RemoveItemAction(item!));
                                        },
                                        child: Icon(Icons.delete)),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  )),
        ),
      ), //Agregar cart
      bottomNavigationBar: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Payment Successful'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: Container(
          color: Colors.yellow.shade600,
          alignment: Alignment.center,
          height: 50.0,
          child: const Text(
            'Proceed to Pay',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}

// class CartInfo extends StatelessWidget {
//   final Cart? cart;

//   const CartInfo({super.key, this.cart});

//   /*final Cart cart;

//   const CartInfo({super.key, required this.cart});*/ //Dejar este...borrar anterio solo esta de ejemplo

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//
//   }
// }
