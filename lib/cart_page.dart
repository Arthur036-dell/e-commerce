import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;
  final Function(Map<String, dynamic>) onItemRemoved;

  const CartPage({
    super.key,
    required this.cartItems,
    required this.onItemRemoved,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Panier'),
        backgroundColor: Colors.blue,
      ),
      body: cartItems.isEmpty
          ? const Center(child: Text('Votre panier est vide.'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                final item = cartItems[index];

                return ListTile(
                  leading: item['imageUrl'] != null
                      ? Image.network(
                          item['imageUrl'],
                          width: 70,
                          height: 70,
                          fit: BoxFit.contain,
                        )
                      : const Icon(Icons.image_not_supported),
                  title: Text(item['title']),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Prix: \$${item['price']}'),
                      Text('Quantité: ${item['quantity']}'),
                    ],
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      onItemRemoved(item);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${item['title']} supprimé du panier !'),
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
