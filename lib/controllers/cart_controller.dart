import '../models/ship.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  int get count => cartItems.length;
  double get totalPrice => cartItems.fold(0, (sum, item) => sum + item.price);
  addToCart(Product product) {
    cartItems.add(product);
  }

  deleteFromCart(int index) {
    Product? deleted = cartItems.firstWhereOrNull((item) {
      return item.id == index;
    });
    cartItems.remove(deleted);
  }
}
