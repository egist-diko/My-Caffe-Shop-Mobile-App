import 'package:dev_app/models/ProductModel.dart';
import 'package:flutter/foundation.dart';

class ProductProvider with ChangeNotifier {
  final List<ProductModel> _products = [
    ProductModel(
      imagePath: 'assets/coffee1.jpg',
      name: 'Cappuccino',
      price: '50k',
      rating: '4.9',
      description: 'With Chocolate',
    ),
    ProductModel(
      imagePath: 'assets/coffee2.jpg',
      name: 'Cappuccino',
      price: '45k',
      rating: '4.7',
      description: 'with Low Fat Milk',
    ),
  ];

  List<ProductModel> get products => _products;

  void addProduct(ProductModel product) {
    _products.add(product);
    notifyListeners();
  }

  void removeProduct(ProductModel product) {
    _products.remove(product);
    notifyListeners();
  }

  void clearProducts() {
    _products.clear();
    notifyListeners();
  }
}
