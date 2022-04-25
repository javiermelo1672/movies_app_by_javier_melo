import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';

class RowStars extends StatelessWidget {
  final int stars;
  const RowStars({Key? key, required this.stars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          stars >= 1 ? Icons.star : Icons.star_border,
          color: whiteColor,
        ),
        Icon(
          stars >= 2 ? Icons.star : Icons.star_border,
          color: whiteColor,
        ),
        Icon(
          stars >= 3 ? Icons.star : Icons.star_border,
          color: whiteColor,
        ),
        Icon(
          stars >= 4 ? Icons.star : Icons.star_border,
          color: whiteColor,
        ),
        Icon(
          stars >= 5 ? Icons.star : Icons.star_border,
          color: whiteColor,
        )
      ],
    );
  }
}
