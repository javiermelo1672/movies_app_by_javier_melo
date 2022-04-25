import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/blocs/favourites_bloc.dart';
import 'package:leal_test_by_javier_melo/data_injector/injector.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';
import 'package:leal_test_by_javier_melo/ui/no_unique_widgets_factory/abstract_factory.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/recommendations_movies_poster.dart';
import 'package:leal_test_by_javier_melo/utils/utils_methos.dart';

class FavouritesUI extends StatefulWidget {
  FavouritesUI({Key? key}) : super(key: key);

  @override
  State<FavouritesUI> createState() => _FavouritesUIState();
}

class _FavouritesUIState extends BaseState<FavouritesUI, FavouritesBloc> {
  late IActivityIndicator _activityIndicator;
  late int _selectedFactoryIndex;
  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetsFactory(),
    CupertinoWidgetsFactory(),
  ];

  @override
  void initState() {
    super.initState();
    _selectedFactoryIndex = verifyPlatform();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: blackColor,
        appBar: AppBar(
          backgroundColor: blackColor,
          foregroundColor: whiteColor,
          centerTitle: true,
          title: Text('Favourites',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  )),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Log out',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Unimplemented feature')));
              },
            ),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: _createForm(_size),
        )));
  }

  Widget _createForm(Size size) {
    final List<Widget> _listOfItems = _listOfWidgets(size, context);

    return SingleChildScrollView(child: Column(children: _listOfItems));
  }

  List<Widget> _listOfWidgets(Size size, BuildContext context) {
    return [
      SizedBox(
        height: size.height * 0.82,
        child: FutureBuilder(
            future: bloc!.getRecommendationsMovies(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (bloc!.recommendations!.isNotEmpty) {
                  return ListView.separated(
                    scrollDirection: Axis.vertical,
                    itemCount: 7,
                    itemBuilder: (_, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            height: 200,
                            child: RecommendationsMoviesPoster(
                              stars: 4,
                              title:
                                  bloc!.recommendations![index].originalTitle!,
                              url: bloc!.recommendations![index].posterPath!,
                              imbd: bloc!.recommendations![index].voteAverage!,
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return const SizedBox(width: 20);
                    },
                  );
                } else {
                  return const Center(
                    child: Text('No hay peliculas recomendadas'),
                  );
                }
              } else {
                return Center(child: _activityIndicator.render());
              }
            }),
      )
    ];
  }

  @override
  getBlocInstance() => FavouritesBloc(Injector().provideMoviesDataUseCase());
}
