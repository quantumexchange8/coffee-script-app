import 'package:coffee_script_app/helper/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';

LikeButton likeButton({
  bool? isFavourite = false,
  Future<bool?> Function(bool liked)? onTapFavourite,
  double? height,
}) =>
    LikeButton(
      isLiked: isFavourite,
      onTap: onTapFavourite,
      likeBuilder: (isLiked) {
        return Image.asset(
          isLiked
              ? 'assets/iconImage/heart-fill.png'
              : 'assets/iconImage/heart-line.png',
          fit: BoxFit.fitHeight,
          height: height ?? height10 * 5,
        );
      },
    );
