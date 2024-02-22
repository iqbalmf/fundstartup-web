import 'package:flutter/material.dart';
import 'package:fundstartup_app/theme/style.dart';
import 'package:fundstartup_app/view/homepage/Components.dart';

import '../theme/colors.dart';

/**
 * Created by IqbalMF on 2024.
 * Package widget
 */
class NavBar extends StatelessWidget {
  final navLinkTitle = ["Home", "Project", "Features", "Success Stories"];
  final navLinkButton = ["Sign Up", "My Account"];
  final String? nameUser, Occupation;
  final Size size;

  NavBar({super.key, this.nameUser, this.Occupation, required this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(50, 20, 50, 20),
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: ColorsApp.greenColor,
                  shape: BoxShape.circle,
                    ),
                child: Center(
                  child: Text(
                    nameUser?[0] ?? "FR",
                    style:
                        TextThemeApp.headline.copyWith(color: Colors.white),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    MenuTitleItem("Home"),
                    MenuTitleItem("Project"),
                    MenuTitleItem("Features"),
                    MenuTitleItem("Success Stories"),
                  ],
                ),
              )
            ],
          ),
          Row(
            children: [
              nameUser == null
                  ? Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RoundedButton("Sign Up"),
                          SizedBox(
                            width: 15,
                          ),
                          RoundedButton("My Account"),
                        ],
                      ),
                    )
                  : LoggedAccount(),
            ],
          ),
        ],
      ),
    );
  }

  Widget LoggedAccount() {
    return Container();
  }
}
