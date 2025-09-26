import 'package:flutter/material.dart';
import 'product.dart';

class ProductTile extends StatelessWidget {
  // The class receives the complete Product object from the product constructor
  final Product product;

  final double borderRadius = 12;

  const ProductTile({
    super.key,
    required this.product, //The product object is received from category_tab
  });

  @override
  Widget build(BuildContext context) {
    // Builder for the widget that uses simple widgets as Container, Column, Row, Text, Image, Icon
    // 'withOpacity' to make lighter shades.
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: product.color.withOpacity(0.1), 
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Column(
          children: [
            // price
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: product.color.withOpacity(0.2), // 
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(borderRadius),
                      topRight: Radius.circular(borderRadius),
                    ),
                  ),
                  padding: const EdgeInsets.all(12),
                  child: Text(
                    '\$${product.price}', // Using the price property from the product object
                    style: TextStyle(
                      color: product.color, 
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),

            // product picture
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 16),
                child: Image.asset(
                  product.imagePath, // Path from the product object
                  fit: BoxFit.contain,
                ),
              ),
            ),

            // product name
            Text(
              product.name, // Name from the product object
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Yummers',
              style: TextStyle(color: Colors.grey),
            ),

            // love icon + add button
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.favorite,
                    color: Colors.pink[400],
                  ),
                  Icon(
                    Icons.add,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}