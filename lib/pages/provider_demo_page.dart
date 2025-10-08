import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';

class ProviderDemoPage extends StatelessWidget {
  const ProviderDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ Watch for real-time updates from CartProvider
    final cartCount = context.watch<CartProvider>().count;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '🛒 Items in Cart: $cartCount',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // ✅ Use read() to modify data without triggering a rebuild
                context.read<CartProvider>().addItem('New Item');
              },
              child: const Text('Add Item to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
