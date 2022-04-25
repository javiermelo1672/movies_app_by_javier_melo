import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/app/settings/app_colors.dart';
import 'package:leal_test_by_javier_melo/blocs/detailed_bloc.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/detailed_movies_poster.dart';
import 'package:leal_test_by_javier_melo/ui/unique_widgets/recommendations_movies_poster.dart';

class DetailPage extends StatefulWidget {
  final List<Result> results;
  const DetailPage({Key? key, required this.results}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends BaseState<DetailPage, Detailedbloc> {
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: blackColor,
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
      const SizedBox(
        height: 30,
      ),
      Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: whiteColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text('Popular',
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                    color: whiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w100,
                  ))
        ],
      ),
      const SizedBox(
        height: 50,
      ),
      SizedBox(
        height: size.height * 0.8,
        child: getPosters(),
      )
    ];
  }

  Widget getPosters() {
    if (widget.results.isNotEmpty) {
      return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 7,
        itemBuilder: (_, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: GestureDetector(
              onTap: () {},
              child: SizedBox(
                height: 300,
                child: DetailedMoviesPoster(
                  stars: 4,
                  title: widget.results[index].originalTitle!,
                  url: widget.results[index].posterPath!,
                  imbd: widget.results[index].voteAverage!,
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
  }

  @override
  getBlocInstance() => Detailedbloc();
}
