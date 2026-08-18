import 'package:flutter/material.dart';
import 'package:kicks/model/cart_item.dart';

class CartCard extends StatelessWidget {
  final CartItem cartItem;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CartCard({
    super.key,
    required this.cartItem,
    required this.increment,
    required this.decrement,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 16, top: 8, bottom: 8),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(cartItem.product.imageUrl, width: 60, height: 60),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cartItem.product.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        "KES ${cartItem.itemTotal}",
                        style: TextStyle(color: Color.fromARGB(207, 46, 65, 232)),
                      ),
                      Spacer(flex: 1),
                      Row(
                        children: [
                          IconButton(onPressed: decrement, icon: Icon(Icons.remove)),
                          Text(cartItem.quantity.toString()),
                          IconButton(onPressed: increment, icon: Icon(Icons.add)),
                        ],
                      ),
                    ],
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