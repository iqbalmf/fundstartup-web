import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fundstartup_app/helper/reponseive_layout.dart';
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
          appBar: ResponsiveLayout.isSmallScreen(context) ? AppBar(
            backgroundColor: ColorsApp.primaryColor,
          ) : PreferredSize(preferredSize: Size(_screenSize.width, 70), child: NavBar(size: _screenSize,)),
          body: SingleChildScrollView(
            child: Column(
              children: [HomeUI(), ListCampaign(), Testimoni(), FooterUI() ],
            ),
          ),
        ));
  }

  Widget HomeUI(){
    return Container(
      height: 500,
      color: ColorsApp.primaryColor,
    );
  }
  Widget ListCampaign(){
    return Container(
      height: 500,
      color: Colors.amber,
    );
  }
  Widget Testimoni(){
    return Container(
      height: 500,
      color: Colors.orange,
    );
  }
  Widget FooterUI(){
    return Container(
      height: 500,
      color: Colors.black,
    );
  }
}
