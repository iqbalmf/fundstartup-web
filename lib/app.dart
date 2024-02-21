import 'package:flutter/material.dart';
import 'package:fundstartup_app/view/homepage/HomePage.dart';
import 'package:get/get.dart';

/**
 * Created by IqbalMF on 2024.
 * Package
 */
class FundApp extends StatelessWidget {
  const FundApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Fundraising App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.amber)
          )
      ),
      home: HomePage(),
    );
  }
}
