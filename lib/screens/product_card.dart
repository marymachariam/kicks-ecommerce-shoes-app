import 'package:flutter/material.dart';
import 'package:kicks/model/product.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(left: 16, right: 20, top: 8, bottom: 8),
      child: Padding(padding: EdgeInsets.all(8),
        child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(product.imageUrl, width: 150, height: 150),
           ),



          SizedBox(width: 8),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              
              children: [
                Text(product.name),
                SizedBox(height: 8),
                Text(product.description),
                SizedBox(height: 8),
                Text('KES ${product.price}'),
                SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
      )
    );
  }
}

final List<Product> dummyProducts = [
  Product(
    'Wireless Headphones',
    'Over ear headphones with noise cancelling',
    31000.0,
    'https://picsum.photos/seed/car/300/300',
  ),
  Product(
    'Smart Watch',
    'Track steps, heart rate, calories, sync with phone and more',
    3500.0,
    'https://picsum.photos/seed/watch/300/300',
  ),
  Product(
    'Backpack',
    'Anti theft laptop bag with durable build and rugged materials',
    800.0,
    'https://picsum.photos/seed/backpack/300/300',
  ),
  Product(
    'Nothing phone 2',
    'Relentlessly excelsior, Android Samsung 32',
    64000.0,
    'https://picsum.photos/seed/smartphone/300/300',
  ),
  Product(
    'Coaster',
    'Anti spill anti slip coffee coaster with style',
    150.0,
    'https://picsum.photos/seed/coaster/300/300',
  ),
  Product(
    'Sharpener',
    'Mechanical pencil sharpener with collection tray for upto 300cc',
    150.0,
    'https://picsum.photos/seed/pencil/300/300',
  ),
];
