import 'package:flutter/material.dart';
import 'core/constants/app_colors.dart';
import 'views/dashboard_view.dart';

void main() {
  runApp(const CryvenApp());
}

class CryvenApp extends StatelessWidget {
  const CryvenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cryven - Crypto Trading Terminal',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: AppColors.background,
        primaryColor: AppColors.primaryBlue,
      ),
      home: const DashboardView(),
    );
  }
}