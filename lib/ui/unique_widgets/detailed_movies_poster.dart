import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/ui/platform_widgets/platform_round_button.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/row_stars.dart';

class DetailedMoviesPoster extends StatelessWidget {
  final String title;
  final int stars;
  final double imbd;
  final String url;
  const DetailedMoviesPoster(
      {Key? key,
      required this.title,
      required this.stars,
      required this.url,
      required this.imbd})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width * 0.82,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 400,
                width: 250,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: whiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: size.width * 0.3,
            child: RowStars(
              stars: stars,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text("imbd: $imbd",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: grayColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: 220,
            height: 50,
            child: PlatformRoundButton(
              text: "Watch Now",
              onPressed: () {},
              textColor: blackColor,
              color: mainColor,
            ),
          ),
        ],
      ),
    );
  }
}
