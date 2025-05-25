import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/cart_bloc.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          return ListView(
            children: state.items.entries.map((e) {
              return ListTile(
                title: Text(e.key.title),
                subtitle: Text('Quantity: ${e.value}'),
                trailing: Text('\$${(e.key.price * e.value).toStringAsFixed(2)}'),
              );
            }).toList()
              ..add(
                ListTile(
                  title: const Text('Total'),
                  trailing: Text('\$${state.total.toStringAsFixed(2)}'),
                ),
              ),
          );
        },
      ),
    );
  }
}
