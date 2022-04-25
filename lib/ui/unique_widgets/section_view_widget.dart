import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';

class SectionViewWidget extends StatelessWidget {
  final String title;
  final Widget content;
  final BuildContext context;
  final bool? showAction;
  final Function? action;
  const SectionViewWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.context,
      this.showAction = false,
      this.action})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(title,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: whiteColor,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
        Container(height: size.height * 0.015),
        content,
        showAction!
            ? GestureDetector(
                onTap: () {
                  action!.call();
                },
                child: Row(children: [
                  const Spacer(),
                  Text("See All",
                      style: Theme.of(context).textTheme.subtitle1!.copyWith(
                            color: mainColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          )),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: mainColor,
                  )
                ]),
              )
            : const SizedBox(),
      ],
    );
  }
}
