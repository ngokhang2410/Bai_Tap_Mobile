import 'package:flutter/material.dart';

import 'cart_screen.dart';
import 'forgot_password_screen.dart';
import 'login.dart';
import 'product_detail_screen.dart';
import 'product_list_screen.dart';
import 'product_model.dart';
import 'register_screen.dart';
import 'settings_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const double _phoneWidth = 390;
  static const double _phoneHeight = 844;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ShopEasy',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      builder: (context, child) {
        return ColoredBox(
          color: const Color(0xFFE8EEF5),
          child: Center(
            child: Container(
              width: _phoneWidth,
              height: _phoneHeight,
              clipBehavior: Clip.antiAlias,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.18),
                    blurRadius: 32,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: MediaQuery(
                data: MediaQuery.of(context)
                    .copyWith(size: const Size(_phoneWidth, _phoneHeight)),
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
      initialRoute: '/products',
      routes: {
        '/products': (context) => const ProductListScreen(),
        '/product-detail': (context) {
          final product =
              ModalRoute.of(context)?.settings.arguments as Product? ??
              sampleProducts.first;
          return ProductDetailScreen(product: product);
        },
        '/cart': (context) => const CartScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
