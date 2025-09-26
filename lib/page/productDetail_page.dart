import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/product.dart';
import '../utilities/cart_model.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // Scaffold provides the basic material design visual layout structure 
      appBar: AppBar(
        title: Text(product.name), 
        backgroundColor: product.color,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Image.asset(
              product.imagePath, 
              fit: BoxFit.contain, // Use 'contain' to avoid cropping
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              product.name, 
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              "\$${product.price}",
              style: const TextStyle(fontSize: 22, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              "Product description: Delicious and fresh 😋",
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
          ),
          const Spacer(), // Adds a flexible space
          Padding(
            padding: const EdgeInsets.all(16),
            child: ElevatedButton.icon(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).addToCart(product); // Add product to cart without listening for changes
                ScaffoldMessenger.of(context).showSnackBar(                        // Show a snackbar message after adding to cart
                  SnackBar(
                    content: Text("${product.name} Added to cart!"), 
                    duration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text("Add to cart"),
              style: ElevatedButton.styleFrom(
                backgroundColor: product.color,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}