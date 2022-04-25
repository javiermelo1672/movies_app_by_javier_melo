import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/ui/platform_widgets/platform_round_button.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/row_stars.dart';

class RecommendationsMoviesPoster extends StatelessWidget {
  final String title;
  final int stars;
  final double imbd;
  final String url;
  const RecommendationsMoviesPoster(
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 190,
                width: 150,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(url), fit: BoxFit.cover)),
              ),
            ),
          ),
          const SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              SizedBox(
                width: size.width * 0.4,
                child: Text(title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                          color: whiteColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w400,
                        )),
              ),
              const SizedBox(
                height: 10,
              ),
              RowStars(
                stars: stars,
              ),
              const SizedBox(
                height: 10,
              ),
              Text("imbd: $imbd",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        color: grayColor,
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                      )),
              const Spacer(),
              Row(
                children: [
                  SizedBox(
                    width: 120,
                    height: 50,
                    child: PlatformRoundButton(
                      text: "Watch Now",
                      onPressed: () {},
                      textColor: blackColor,
                      color: mainColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Icon(
                      Icons.heart_broken_outlined,
                      color: whiteColor,
                      size: 30,
                    ),
                  )
                ],
              )
            ],
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
