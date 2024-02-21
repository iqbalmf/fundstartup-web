import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundstartup_app/view/homepage/Components.dart';

/**
 * Created by IqbalMF on 2024.
 * Package view.homepage
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(50), color: Colors.white, child: appbar()),
    );
  }

  Widget appbar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              ClipOval(
                child: Container(
                  height: 50, width: 50, color: Colors.greenAccent,
                  child: Center(child: Text("FR")),
                ),
              ),
              SizedBox(width: 15),
              Text("Home"),
              SizedBox(width: 10),
              Text("Project"),
              SizedBox(width: 10),
              Text("Features"),
              SizedBox(width: 10),
              Text("Success Stories"),
            ],
          ),
          Row(
            children: [
              RoundedButton("Daftar"),
              SizedBox(width: 12),
              RoundedButton("Akun Saya"),
            ],
          )
        ],
      ),
    );
  }
}
