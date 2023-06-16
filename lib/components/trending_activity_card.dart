import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import '../constants/app_styles.dart';
import '../constants/constants.dart';
import 'favorite_button.dart';

class TrendingActivityCard extends StatelessWidget {
  const TrendingActivityCard({
    super.key,
    required this.activityThumbnail,
    required this.price,
    required this.activityName,
    required this.city,
  });

  final String activityThumbnail;
  final String activityName;
  final String city;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 197,
      width: 164,
      margin: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Stack(
            children: [
              // Thumbnail Widget
              SizedBox(
                height: 135,
                width: 144,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9),
                  child: Image.asset(activityThumbnail, fit: BoxFit.cover),
                ),
              ),

              // Price Widget
              Positioned(
                right: 10,
                bottom: 10,
                child: BlurryContainer(
                  blur: 12,
                  height: 24,
                  width: 51,
                  elevation: 0,
                  color: Colors.white30,
                  padding: const EdgeInsets.symmetric(vertical: 1),
                  child: Center(
                    child: Text(
                      price != "FREE" ? '$price SR' : price,
                      style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          height8,

          // Activity Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(activityName, style: headLineStyle4),
                  height4,
                  Row(
                    children: [
                      const Icon(Icons.location_on_sharp,
                          color: primaryColor, size: 11),
                      width4,
                      Text(city, style: headLineStyle6),
                    ],
                  ),
                ],
              ),
              const FavoriteButton(),
            ],
          )
        ],
      ),
    );
  }
}
