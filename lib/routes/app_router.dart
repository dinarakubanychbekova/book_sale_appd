import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../pages/home_page.dart';
import '../pages/book_view_page.dart';
import '../pages/cart_page.dart';
import '../models/book.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => const HomePage(),
    ),
    GoRoute(
      path: '/book',
      name: 'book',
      builder: (context, state) {
        final book = state.extra;
        if (book is Book) {
          return BookViewPage(book: book);
        } else {
          return const Scaffold(body: Center(child: Text('Ошибка: книга не передана')));
        }
      },
    ),
    GoRoute(
      path: '/cart',
      name: 'cart',
      builder: (context, state) => const CartPage(),
    ),
  ],
);
