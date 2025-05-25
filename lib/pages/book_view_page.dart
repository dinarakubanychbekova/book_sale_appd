import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';
import '../blocs/cart_bloc.dart';

class BookViewPage extends StatelessWidget {
  final Book book;

  const BookViewPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: Center(
        child: Column(
          children: [
            Text('Price: \$${book.price}'),
            ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddToCart(book));
              },
              child: const Text('Add to Cart'),
            )
          ],
        ),
      ),
    );
  }
}
