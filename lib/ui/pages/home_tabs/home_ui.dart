import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/blocs/home_bloc.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';
import 'package:leal_test_by_javier_melo/ui/pages/home_tabs/pages/favourites_ui.dart';
import 'package:leal_test_by_javier_melo/ui/pages/home_tabs/pages/movies_ui.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/fab_bottom_app_bar.dart';

class HomeUI extends StatefulWidget {
  HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends BaseState<HomeUI, Homebloc> {
  late PageController _controller;
  int tabSelected = 0;

  @override
  void initState() {
    _controller = PageController(
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: _buildingPageViewWidget(size),
      bottomNavigationBar: FABBottomAppBar(
        height: 70,
        centerItemText: '',
        color: whiteColor,
        selectedColor: mainColor,
        backgroundColor: blackColor,
        items: [..._listOfHomeTabsFAB(context)],
      ),
    );
  }

  Widget _buildingPageViewWidget(Size size) {
    return SafeArea(
      child: Stack(
        children: [
          SizedBox(
            height: size.height * 0.90,
            width: double.infinity,
            child: PageView(
              //Builds the pageview
              physics: const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              children: <Widget>[
                MoviesUI(),
                FavouritesUI(),
                MoviesUI(),
                MoviesUI(),
              ],
              controller: _controller,
            ),
          ),
        ],
      ),
    );
  }

  List<FABBottomAppBarItem> _listOfHomeTabsFAB(BuildContext context) {
    return <FABBottomAppBarItem>[
      FABBottomAppBarItem(
          icon: Icons.home,
          onButtonSelected: (page) async {
            _onChangePageEvent(page, context);
          },
          isSelected: tabSelected == 0,
          text: l10n!.home),
      FABBottomAppBarItem(
          icon: Icons.heart_broken,
          onButtonSelected: (page) async {
            _onChangePageEvent(page, context);
          },
          isSelected: tabSelected == 1,
          text: l10n!.favorites),
      FABBottomAppBarItem(
          icon: Icons.replay_outlined,
          onButtonSelected: (page) async {
            _onChangePageEvent(page, context);
          },
          isSelected: tabSelected == 2,
          text: l10n!.recent),
      FABBottomAppBarItem(
          icon: Icons.search,
          onButtonSelected: (page) async {
            _onChangePageEvent(page, context);
          },
          isSelected: tabSelected == 3,
          text: l10n!.search),
    ];
  }

  void _onChangePageEvent(int page, BuildContext context) {
    _controller.animateToPage(page,
        duration: const Duration(milliseconds: 1), curve: Curves.easeIn);
    setState(() {
      tabSelected = page; // Set local variable to change the tab color
    });
  }

  @override
  getBlocInstance() => Homebloc();
}
