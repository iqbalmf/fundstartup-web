import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundstartup_app/helper/constants.dart';
import 'package:fundstartup_app/helper/reponseive_layout.dart';
import 'package:fundstartup_app/theme/style.dart';
import 'package:fundstartup_app/view/homepage/Components.dart';
import 'package:fundstartup_app/widget/navbar.dart';

import '../../theme/colors.dart';

/**
 * Created by IqbalMF on 2024.
 * Package view.homepage
 */
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    return Container(
        child: Scaffold(
      backgroundColor: ColorsApp.primaryColor,
      appBar: ResponsiveLayout.isSmallScreen(context)
          ? AppBar(
              backgroundColor: ColorsApp.primaryColor,
            )
          : PreferredSize(
              preferredSize: Size(_screenSize.width, 70),
              child: NavBar(
                size: _screenSize,
              )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HomeUI(_screenSize),
            Illustration(_screenSize),
            ListCampaign(),
            Testimoni(),
            FooterUI()
          ],
        ),
      ),
    ));
  }

  Widget HomeUI(Size size) {
    return Container(
      height: 500,
      color: ColorsApp.primaryColor,
      padding: EdgeInsets.symmetric(horizontal: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            width: size.width * 0.38,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "We helps startup to getting started & funding their truly needs",
                  style: TextThemeApp.regularText
                      .copyWith(color: ColorsApp.whiteColor, fontSize: 25),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Fund the best idea to become a real product and be the contributor",
                  style: TextThemeApp.regularText.copyWith(
                      color: ColorsApp.whiteColor,
                      fontSize: 18,
                      fontWeight: light),
                ),
                SizedBox(
                  height: 20,
                ),
                RoundedButtonColors("Find Project", null),
              ],
            ),
          ),
          Container(
            height: size.width * 0.2,
            width: size.width * 0.3,
            decoration: BoxDecoration(
              color: ColorsApp.greenColor,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                image: AssetImage(IconAssets.ImageHomeUI),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Illustration(Size size) {
    return Container(
      height: size.height * 0.67,
      padding: EdgeInsets.symmetric(horizontal: 35),
      color: ColorsApp.whiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50,),
          Padding(
            padding: const EdgeInsets.only(left: 80),
            child: Text("Hanya butuh 3 langkah untuk\nmenjalankan ide cemerlang Anda!", style: TextThemeApp.regularText.copyWith(fontSize: 20),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: size.height * 0.49,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(IconAssets.IllustrationCampaign),
                  fit: BoxFit.contain,
                ),
              )),
        ],
      ),
    );
  }

  Widget ListCampaign() {
    return Container(
      height: 500,
      color: ColorsApp.whiteColor,
    );
  }

  Widget Testimoni() {
    return Container(
      height: 500,
      color: ColorsApp.whiteColor,
    );
  }

  Widget FooterUI() {
    return Container(
      height: 500,
      color: ColorsApp.whiteColor,
    );
  }
}
