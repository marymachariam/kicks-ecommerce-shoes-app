import 'package:flutter/material.dart';
import 'package:kicks/model/cart.dart';
import 'package:kicks/model/product.dart';
import 'package:kicks/screens/cart_card.dart';
import 'package:kicks/screens/product_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _tabTitle = "Home";

  final List<Widget> _tabs = [
    _HomeTab(),
    _CartTab(),
    _OdersTab(),
    _ProfileTab()
  ];
  final List<String> _titles = ["Home", "Cart", "Orders", "Profile"];

  void _onTabClicked(int index) {
    setState(() {
      _selectedIndex = index;
      _tabTitle = _titles[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_tabTitle)),
      body: IndexedStack(index: _selectedIndex, children: _tabs),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: const Color.fromARGB(255, 231, 138, 238),
        currentIndex: _selectedIndex,
        onTap: _onTabClicked,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_outlined),
            activeIcon: Icon(Icons.shopping_bag),
            label: "Orders",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            activeIcon: Icon(Icons.person_2),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyProducts.length,
      itemBuilder: (context, index) {
        final currentProduct = dummyProducts[index];
        return ProductCard(product: currentProduct);
      },
    );
  }
}

class _CartTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartModel>(
      builder: (context, cart, child) {
        if (cart.items.isEmpty) {
          return const Center(child: Text("Cart is empty"));
        }

        return ListView.builder(
          itemCount: cart.items.length,
          itemBuilder: (context, index) {
            final item = cart.items[index];
            return CartCard(
              cartItem: item,
              increment: () => cart.increment(item),
              decrement: () => cart.decrement(item),
            );
          },
        );
      },
    );
  }
}

class _OdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Orders"));
  }
}

class _ProfileTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile"));
  }
}