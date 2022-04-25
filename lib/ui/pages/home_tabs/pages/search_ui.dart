import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/blocs/search_bloc.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';

class SearchUI extends StatefulWidget {
  SearchUI({Key? key}) : super(key: key);

  @override
  State<SearchUI> createState() => _SearchUIState();
}

class _SearchUIState extends BaseState<SearchUI, Searchbloc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackColor,
      body: Center(
        child: Text("Unimplementhed Search Page",
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
  getBlocInstance() => Searchbloc();
}
