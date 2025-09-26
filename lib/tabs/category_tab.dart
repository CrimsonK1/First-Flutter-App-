import 'package:flutter/material.dart';
import '../utilities/product.dart';
import '../utilities/product_data.dart';
import '../utilities/productTile.dart';
import '../page/productDetail_page.dart';

// Widget to display products of a specific category in a grid
class CategoryTab extends StatelessWidget { // Stateless widget since it doesn't manage any state, just displays data
  final String category;                   // Category parameter to filter products by

  const CategoryTab({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    // Filter products by the received category and convert to a list
    final List<Product> categoryProducts =
        allProducts.where((p) => p.category == category).toList();

    return GridView.builder( // Build a grid view to display visible products on screen and recycle off-screen widgets
      itemCount: categoryProducts.length,
      padding: const EdgeInsets.all(12.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.5,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemBuilder: (context, index) {
        final product = categoryProducts[index];
        // Make each product "touchable"
        return GestureDetector(
          onTap: () {
            // Navigate to the details page when a product is tapped
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ProductDetailPage(product: product),
              ),
            );
          },
          child: ProductTile(product: product),
        );
      },
    );
  }
}