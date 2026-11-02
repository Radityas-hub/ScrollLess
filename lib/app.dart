import 'package:flutter/material.dart';
import 'package:scrollless/core/theme/app_theme.dart';
import 'package:scrollless/features/home/screens/home_screen.dart';

class ScrollLessApp extends StatelessWidget {
  const ScrollLessApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ScrollLess',
      theme: AppTheme.light,
      home: const HomeScreen(),
    );
  }
}
