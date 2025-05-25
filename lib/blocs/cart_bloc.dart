import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/book.dart';

abstract class CartEvent {}

class AddToCart extends CartEvent {
  final Book book;
  AddToCart(this.book);
}

class RemoveFromCart extends CartEvent {
  final Book book;
  RemoveFromCart(this.book);
}

class CartState {
  final Map<Book, int> items;
  CartState({required this.items});

  double get total =>
      items.entries.fold(0, (sum, e) => sum + e.key.price * e.value);
}

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState(items: {})) {
    on<AddToCart>((event, emit) {
      final updated = Map<Book, int>.from(state.items);
      updated[event.book] = (updated[event.book] ?? 0) + 1;
      emit(CartState(items: updated));
    });

    on<RemoveFromCart>((event, emit) {
      final updated = Map<Book, int>.from(state.items);
      updated.remove(event.book);
      emit(CartState(items: updated));
    });
  }
}
