import 'package:flutter/material.dart';

/**
 * Created by IqbalMF on 2024.
 * Package helper
 */

class ResponsiveLayout extends StatelessWidget {
  final Widget smallScreen;
  final Widget mediumScreen;
  final Widget largeScreen;

  const ResponsiveLayout(
      {super.key, required this.smallScreen, required this.mediumScreen, required this.largeScreen});

  static bool isSmallScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 800;
  }

  static bool isMediumScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 800 &&
        MediaQuery.of(context).size.width < 1200;
  }

  static bool isLargeScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 1200;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return largeScreen;
      } else if (constraints.maxWidth < 1200 && constraints.maxWidth > 800) {
        return mediumScreen;
      } else {
        return smallScreen;
      }
    });
  }
}
