import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jawla_app/components/button.dart';
import 'package:jawla_app/components/text_field.dart';
import 'package:jawla_app/constants/app_styles.dart';
import 'package:jawla_app/constants/constants.dart';

import '../components/trending_activity_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Explore \nSaudi Arabia",
                  style: headLineStyle1,
                ),
                CustomButton(
                  text: "Add Activity",
                  onPressed: () {},
                  width: 100,
                  height: 35,
                )
              ],
            ),
            height16,
            CustomTextFieldState().searchTextFeild(context, Icons.search,
                FontAwesomeIcons.sliders, "Search", searchController),
            height16,
            const Text("Trending Activities", style: headLineStyle2),
            height8,
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  TrendingActivityCard(
                    activityThumbnail: "assets/images/thumbnails/diving.png",
                    price: "250",
                    activityName: "Diving Tours",
                    city: "Jeddah",
                  ),
                  TrendingActivityCard(
                    activityThumbnail: "assets/images/thumbnails/diriyah.png",
                    price: "FREE",
                    activityName: "Old Town",
                    city: "Riyadh",
                  ),
                  TrendingActivityCard(
                    activityThumbnail: "assets/images/thumbnails/archery.png",
                    price: "100",
                    activityName: "ARCHERY RANGE",
                    city: "Taif",
                  ),
                  TrendingActivityCard(
                    activityThumbnail:
                        "assets/images/thumbnails/paragliding.png",
                    price: "150",
                    activityName: "PARAGLIDING",
                    city: "Abha",
                  ),
                ],
              ),
            ),
            height16,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Activities", style: headLineStyle2),
                InkWell(
                  onTap: () {},
                  child: const Row(
                    children: [
                      Text(
                        "Show more",
                        style: headLineStyle5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 10,
                        color: greyTextColor,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
