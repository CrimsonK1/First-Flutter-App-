import 'package:flutter/material.dart';

class Product { //Class that defines the product in the app
  // 'final' makes sure these properties are immutable after initialization
  final String name; // Name of the product
  final String price; // Price as a string for simplicity
  final Color color; // Color associated with the product
  final String imagePath; // Path to the image asset
  final String category; // To classify every type of product

  Product({ //constructor with named parameters
    required this.name, // 'required' ensures these parameters must be provided
    required this.price, // and prevents null values for products
    required this.color,
    required this.imagePath,
    required this.category,
  });
}