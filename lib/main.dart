import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page/home_page.dart';
import 'utilities/cart_model.dart';

void main() {
  runApp(const MyApp()); // Main function to run the app widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider( // Provides CartModel to the widget tree
      create: (context) => CartModel(), // Create an instance of CartModel that will be available to all child widgets
      child: MaterialApp(               // Root of the application, allows for material design components
        debugShowCheckedModeBanner: false,
        title: 'Food App',
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        home: const HomePage(),
      ),
    );
  }
}