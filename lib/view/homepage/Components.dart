import 'package:flutter/material.dart';

Widget RoundedButton(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    child: Text(text),
    decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}
