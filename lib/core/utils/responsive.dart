import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  final Widget desktop;
  final Widget? tablet;
  final Widget mobile;

  const Responsive({
    super.key,
    required this.desktop,
    this.tablet,
    required this.mobile,
  });

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < 768;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width >= 768 &&
          MediaQuery.of(context).size.width < 1100;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 1100;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width >= 1100) {
      return desktop;
    } else if (width >= 768 && tablet != null) {
      return tablet!;
    } else {
      return mobile;
    }
  }
}