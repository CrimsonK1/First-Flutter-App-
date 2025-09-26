import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/cart_model.dart';
import '../utilities/product.dart'; 

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Consumer is used so that the cart page updates when items are added or removed from the cart
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Cart"),
            backgroundColor: Colors.pink,
          ),
          body: cart.cartItems.isEmpty // Check if the cart is empty
              ? const Center( // Display a message if the cart is empty
                  child: Text("Your cart is empty 🛒"),
                )
              : Column( // If cart is not empty, display the list of items
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: cart.cartItems.length,
                        itemBuilder: (context, index) {
                          final Product product = cart.cartItems[index]; // Specifie the type of product
                          return ListTile(
                            leading: Image.asset(product.imagePath, width: 50), 
                            title: Text(product.name), 
                            subtitle: Text("\$${product.price}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                cart.removeFromCart(product);
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}