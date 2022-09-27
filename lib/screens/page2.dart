import 'package:flutter/material.dart';

import '../models/cart.dart';

class Page2Screen extends StatefulWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page2Screen')),
      body: CartInfo(), //Agregar cart
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

class CartInfo extends StatelessWidget {
  final Cart? cart;

  const CartInfo({super.key, this.cart});

  /*final Cart cart;

  const CartInfo({super.key, required this.cart});*/    //Dejar este...borrar anterio solo esta de ejemplo

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...cart!.items.map((item) => ListView.builder(
            shrinkWrap: true,
            itemCount: cart!.items.length,
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
                        image: AssetImage(item.image),
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
                                        text: item.name,
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
                                        text: item.unit,
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
                                        text: item.price.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold)),
                                  ]),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red.shade800,
                          )),
                    ],
                  ),
                ),
              );
            }))
      ],
    );
  }
}
