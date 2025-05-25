import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../models/book.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final book = Book(id: '1', title: 'Flutter Basics', price: 9.99);
    return Scaffold(
      appBar: AppBar(title: const Text('Books')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(book.title),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('book', extra: book);
              },
              child: const Text('View Book'),
            ),
            ElevatedButton(
              onPressed: () {
                context.pushNamed('cart');
              },
              child: const Text('Go to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
