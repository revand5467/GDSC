import '../models/ship.dart';
import 'package:get/get.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;
  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: 30,
          productDescription: 'some description about product',
          long:
              'A spacecraft is a vehicle or machine designed to fly in outer space. A type of artificial satellite, spacecraft are used for a variety of purposes, including communications, Earth observation, meteorology, navigation, space colonization, planetary exploration, and transportation of humans and cargo. All spacecraft except single-stage-to-orbit vehicles cannot get into space on their own, and require a launch vehicle (carrier rocket). ',
          productImage: 'assets/ship1.jpg',
          productName: 'FirstProd'),
      Product(
          id: 2,
          price: 40,
          productDescription: 'some description about product',
          long:
              'A spacecraft is a vehicle or machine designed to fly in outer space. A type of artificial satellite, spacecraft are used for a variety of purposes, including communications, Earth observation, meteorology, navigation, space colonization, planetary exploration, and transportation of humans and cargo. All spacecraft except single-stage-to-orbit vehicles cannot get into space on their own, and require a launch vehicle (carrier rocket). ',
          productImage: 'assets/ship2.jpg',
          productName: 'SecProd'),
      Product(
          id: 3,
          price: 49.5,
          productDescription: 'some description about product',
          long:
              'A spacecraft is a vehicle or machine designed to fly in outer space. A type of artificial satellite, spacecraft are used for a variety of purposes, including communications, Earth observation, meteorology, navigation, space colonization, planetary exploration, and transportation of humans and cargo. All spacecraft except single-stage-to-orbit vehicles cannot get into space on their own, and require a launch vehicle (carrier rocket). ',
          productImage: 'assets/ship1.jpg',
          productName: 'ThirdProd'),
    ];
    products.value = productResult;
  }
}
