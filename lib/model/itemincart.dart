import 'package:coffee_masters/model/product.dart';

class ItemInCart {
  Product product;
  int quantity;

  ItemInCart({required this.product, required this.quantity});
}