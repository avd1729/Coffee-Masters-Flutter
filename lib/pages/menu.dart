import 'package:coffee_masters/data_manager.dart';
import 'package:coffee_masters/model/product.dart';
import 'package:coffee_masters/model/category.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  final DataManager dataManager;
  const MenuPage({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
      return FutureBuilder<List<Category>>(
        future: dataManager.getMenu(),
        builder: (context, snapshot) {
          
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No categories found'));
          }

          final categories = snapshot.data!;
          return ListView.builder(
            itemCount: categories.length,
            itemBuilder: (context, index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(categories[index].name, style: TextStyle(
                    fontStyle: 
                    FontStyle.normal,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'serif',
                          color: Colors.brown[700],
                          letterSpacing: 1.2,
                  ),),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: categories[index].products.length,
                  itemBuilder: (context, prodIndex) {
                    var product = categories[index].products[prodIndex];
                    return ProductItem(product: product, 
                    onAdd: (addedProduct) {
                      dataManager.cartAdd(addedProduct);
                    });
                })
              ],
            );
          });
        },
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
            Image.network(product.imageUrl),
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
                    child: const Text("Add"),
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