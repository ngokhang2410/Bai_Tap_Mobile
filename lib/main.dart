import 'package:flutter/material.dart';

import 'login.dart';
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
      title: 'Tên ứng dụng',
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
                data: MediaQuery.of(context).copyWith(
                  size: const Size(_phoneWidth, _phoneHeight),
                ),
                child: child ?? const SizedBox.shrink(),
              ),
            ),
          ),
        );
      },
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
    );
  }
}
