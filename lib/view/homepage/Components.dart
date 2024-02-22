import 'package:flutter/material.dart';
import 'package:fundstartup_app/theme/colors.dart';
import 'package:fundstartup_app/theme/style.dart';

Widget RoundedButton(String text) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
    child: Text(text, style: TextThemeApp.regularText.copyWith(color: ColorsApp.whiteColor),),
    decoration: BoxDecoration(
        border: Border.all(
          color: ColorsApp.whiteColor,
        ),
        borderRadius: BorderRadius.all(Radius.circular(20))),
  );
}

Widget MenuTitleItem(String title) {
  return Container(
    padding: EdgeInsets.only(left: 20),
    child: Text(
      title,
      style: TextThemeApp.regularText.copyWith(color: ColorsApp.whiteColor),
    ),
  );
}
