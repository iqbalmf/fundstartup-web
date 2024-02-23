import 'package:flutter/material.dart';
import 'package:fundstartup_app/domain/campaign_entity.dart';
import 'package:fundstartup_app/helper/reponseive_layout.dart';
import 'package:fundstartup_app/theme/colors.dart';
import 'package:fundstartup_app/theme/style.dart';

class ItemCampaign extends StatefulWidget {
  const ItemCampaign(
      {super.key, required this.onTap, required this.campaignData});

  final Function() onTap;
  final CampaignEntity campaignData;

  @override
  State<ItemCampaign> createState() => _State();
}

class _State extends State<ItemCampaign> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.all(defaultMargin),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          border: Border.all(
            color: ColorsApp.greyColor2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.all(defaultMargin),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Container(
                child: Image(
                  image: NetworkImage("https://images.unsplash.com/photo-1593642634402-b0eb5e2eebc9?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80"),
                    fit: BoxFit.cover,
                  ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Text(
                      "Title",
                      style: TextThemeApp.headline,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric( horizontal: defaultMargin),
                    child: Text(
                      "SubTitle....",
                      style: TextThemeApp.subtitleText.copyWith(fontSize: 14),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: defaultMargin,horizontal: defaultMargin),
                    child: LinearProgressIndicator(
                      value: 25 / 100,
                      minHeight: 10,
                      backgroundColor: Colors.blue.shade100,
                      color: ColorsApp.primaryColor,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: defaultMargin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "25%",
                          style:
                              TextThemeApp.regularText.copyWith(fontSize: 20),
                        ),
                        Text(
                          "Rp.100.000.000",
                          style: TextThemeApp.headline.copyWith(fontSize: 20),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
