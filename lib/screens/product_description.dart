import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';
//import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class Description extends StatelessWidget {
  int productNo;
  final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Colors.black54,
      textStyle: const TextStyle(fontSize: 24, color: Colors.white),
      elevation: 10);

  Description(this.productNo);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Space Ship Description"),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.comment),
              tooltip: 'Comment Icon',
              onPressed: () {},
            ), //IconButton
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<Widget>[]
          backgroundColor: Colors.greenAccent[400],
          elevation: 50.0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            tooltip: 'Menu Icon',
            onPressed: () {
              Get.back();
            },
          ),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
            label: GetX<CartController>(builder: (controller) {
              return Text('${controller.count}');
            }),
            backgroundColor: Colors.amber,
            icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.black)),
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Container(
            child: Column(
              children: [
                Expanded(
                    child: ListView(
                  padding: const EdgeInsets.all(8),
                  children: <Widget>[
                    Container(
                      height: 300,
                      color: Colors.amber[600],
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                            style: TextStyle(fontSize: 24),
                            shoppingController.products[productNo].productName),
                      ),
                    ),
                    Container(
                      height: 300,
                      color: Colors.amber[600],
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Image.asset(shoppingController
                            .products[productNo].productImage),
                      ),
                    ),
                    Container(
                      color: Colors.amber[600],
                      padding: const EdgeInsets.all(16.0),
                      child: Center(
                        child: Text(
                            style: TextStyle(fontSize: 24),
                            shoppingController.products[productNo].long),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        ElevatedButton(
                          style: style,
                          onPressed: () {
                            cartController.addToCart(
                                shoppingController.products[productNo]);
                          },
                          child: Expanded(
                            child: Row(
                              children: [
                                Text('Add to cart'),
                                Icon(Icons.add),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: style,
                          onPressed: () {
                            cartController.deleteFromCart(productNo);
                          },
                          child: Expanded(
                            child: Row(
                              children: [
                                Text('Remove'),
                                Icon(Icons.delete),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          ),
        ));
  }
}
