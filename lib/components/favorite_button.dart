import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

import '../constants/app_styles.dart';

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 12,
      backgroundColor: const Color(0xFFF5F5F5),
      child: LikeButton(
        size: 12,
        circleColor:
            const CircleColor(start: primaryColor, end: secondaryColor),
        bubblesColor: const BubblesColor(
          dotPrimaryColor: primaryColor,
          dotSecondaryColor: secondaryColor,
        ),
        likeBuilder: (bool isLiked) {
          return Icon(
            Icons.favorite,
            color: isLiked ? primaryColor : const Color(0xFFCECECE),
            size: 12,
          );
        },
      ),
      // Icon(
      //   Icons.favorite,
      //   size: 12,
      //   color: (clicked == true) ? primaryColor : const Color(0xFFCECECE),
      // ),
    );
  }
}
