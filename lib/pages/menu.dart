import 'package:coffee_masters/data_manager.dart';
import 'package:coffee_masters/model/product.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ProductItem(
        product: Product(
          id: 1, 
          name: "IPhone 16 Pro Max", 
          price: 2000, 
          image: ""), onAdd: () {},),
        ProductItem(
        product: Product(
          id: 1, 
          name: "IPhone 16 Pro Max", 
          price: 2000, 
          image: ""), onAdd: () {},)
      ],
    );
  }
}

class ProductItem extends StatelessWidget {

  final Product product;
  final Function onAdd;

  const ProductItem({super.key, required this.product, required this.onAdd});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("images/black_coffee.png"),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(product.name, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0,  right: 20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      onAdd(product);
                    },
                    child: const Text("Add + "),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("\$${product.price}", style: TextStyle(fontWeight: FontWeight.bold),),
            )
          ],
        ),
      ),
    );
  }
}