import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../utilities/myTab.dart';
import '../tabs/category_tab.dart';
import '../utilities/cart_model.dart';
import 'cart_page.dart';

class HomePage extends StatefulWidget { // Stateful widget to manage tabs and cart state
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> { // State class for HomePage
  List<Widget> myTabs = const [
    MyTab(iconPath: 'assets/icons/dona.jpg'), 
    MyTab(iconPath: 'assets/icons/icecream.jpg'),
    MyTab(iconPath: 'assets/icons/burger.jpg'),
    MyTab(iconPath: 'assets/icons/pizza.jpg'),
    MyTab(iconPath: 'assets/icons/drinks.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController( //Syncronize tabBar and tabBarView
      length: myTabs.length,
      // Scaffold is covered by DefaultTabController, so a new context is needed under the homepage context
      child: Builder(
        builder: (BuildContext innerContext) { // 'innerContext' is created here
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 24.0),
                child: IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.grey[800],
                    size: 36,
                  ),
                  onPressed: () {
                    // The code for opening a side menu (drawer) can go here, not implemented in this project
                  },
                ),
              ),
              // Another actions such as a profile creation can be added here, not implemented in this project
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: IconButton(
                    icon: Icon(
                      Icons.person,
                      color: Colors.grey[800],
                      size: 36,
                    ),
                    onPressed: () {
                      // The code for a profile button can go here, not implemented in this project
                    },
                  ),
                )
              ],
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => Navigator.push(
                innerContext, 
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ),
              ),
              backgroundColor: Colors.pink,
              child: Consumer<CartModel>( // Listen to changes in CartModel to update the badge count
                builder: (context, cart, child) { // 'cart' is the instance of CartModel
                  return Badge(
                    label: Text(cart.cartItems.length.toString()),
                    isLabelVisible: cart.cartItems.isNotEmpty,
                    child: const Icon(Icons.shopping_cart),
                  );
                },
              ),
            ),
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical: 18),
                  child: Row(
                    children: [
                      Text(
                        'I want to',
                        style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                      ),
                      const Text(
                        ' EAT',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                TabBar(tabs: myTabs),
                Expanded(
                  child: TabBarView( // Displays the content for each tab
                    children: const [
                      CategoryTab(category: "donut"),
                      CategoryTab(category: "icecream"),
                      CategoryTab(category: "burger"),
                      CategoryTab(category: "pizza"),
                      CategoryTab(category: "drinks"),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}