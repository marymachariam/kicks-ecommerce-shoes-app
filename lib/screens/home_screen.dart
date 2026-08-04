import 'package:flutter/material.dart';
import 'package:kicks/screens/product_card.dart';


class HomeScreen extends StatefulWidget{
  const HomeScreen({super.key});
   @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedTab = 0;
  String _tabTitle = "Home";
  final List<Widget> _tabs = [_HomeTab(), _OrdersTab(), _ProfileTab()];
  final List<String> _titles = ['Homes', 'Orders', 'Profile'];

void _onTabClicked(int index){
  setState(() {
    _selectedTab = index;
    _tabTitle = _titles[index];
  });
}


  @override
  Widget build(BuildContext context) {
   return Scaffold(
    appBar: AppBar(title: Text(_tabTitle)),
    body: IndexedStack(index: _selectedTab,children: _tabs,),
    bottomNavigationBar: BottomNavigationBar(
      currentIndex: _selectedTab,
      onTap: _onTabClicked,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home_outlined),
      activeIcon: Icon(Icons.home),
      label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),
      activeIcon: Icon(Icons.shopping_bag),
      label: "Orders"),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_outlined),
      activeIcon: Icon(Icons.person_2),
      label: "Profile"),
    ]),

   );
  }
}

class _HomeTab extends StatelessWidget{
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

class _OrdersTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Orders'));
   
  }
}
class _ProfileTab extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(child: Text('Profile'));
  }
}