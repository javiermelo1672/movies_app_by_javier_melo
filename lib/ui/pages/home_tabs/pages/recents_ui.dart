import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/blocs/recents_bloc.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';

class RecentsUI extends StatefulWidget {
  RecentsUI({Key? key}) : super(key: key);

  @override
  State<RecentsUI> createState() => _RecentsUIState();
}

class _RecentsUIState extends BaseState<RecentsUI, Recentsbloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text("Unimplementhed Recents Page",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
      ),
    );
  }

  @override
  getBlocInstance() => Recentsbloc();
}
