import 'package:carrito/list.dart';
import 'package:carrito/models/cart.dart';
import 'package:carrito/models/item_model.dart';
import 'package:carrito/redux/actions.dart';
import 'package:carrito/redux/app_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class ProductWidget extends StatelessWidget {
  final Item? product;

  // ignore: use_key_in_widget_constructors
  const ProductWidget({this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, bottom: 5, top: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.amber[100],
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10, top: 10),
            child: Row(
              children: [
                Image(
                  height: 80,
                  width: 80,
                  image: AssetImage(product!.image.toString()),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(product!.name),
              ],
            ),
          ),
          Checkbox(
            value: product?.selected,
            onChanged: (bool? value) {
              StoreProvider.of<AppState>(context)
                  .dispatch(UpdateCartAction(product!));
            },
          ),
        ],
      ),
    );
  }
}
