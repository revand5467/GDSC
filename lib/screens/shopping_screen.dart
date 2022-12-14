import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:milky/screens/product_description.dart';
import '../controllers/cart_controller.dart';
import '../controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {},
          label: GetX<CartController>(builder: (controller) {
            return Text('${controller.count}');
          }),
          backgroundColor: Colors.amber,
          icon: Icon(Icons.add_shopping_cart_rounded, color: Colors.black)),
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                itemCount: controller.products.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.all(12),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(Description(index));
                              print("pressed");
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                    Container(
                                      child: Image.asset(
                                          controller
                                              .products[index].productImage,
                                          height: 300,
                                          width: 250),
                                    ),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          GetX<CartController>(builder: (controller) {
            return Text('Total amount: \$ ${controller.totalPrice}',
                style: TextStyle(fontSize: 30, color: Colors.white));
          }),
          SizedBox(height: 100),
        ]),
      ),
    );
  }
}
