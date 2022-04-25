import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/row_stars.dart';

import '../../app/settings/app_colors.dart';

class MoviesPoster extends StatelessWidget {
  final String title;
  final int stars;
  final String url;
  const MoviesPoster({
    Key? key,
    required this.title,
    required this.stars,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 200,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: whiteColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                  )),
          const SizedBox(height: 10),
          RowStars(
            stars: stars,
          ),
        ],
      ),
    );
  }
}
