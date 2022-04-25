import 'package:flutter/material.dart';
import 'package:leal_test_by_javier_melo/blocs/detailed_movie_bloc.dart';
import 'package:leal_test_by_javier_melo/data_injector/injector.dart';
import 'package:leal_test_by_javier_melo/models/popular_movies_response.dart';
import 'package:leal_test_by_javier_melo/ui/base_state.dart';

class DetailedMoviePage extends StatefulWidget {
  final Result movie;
  DetailedMoviePage({Key? key, required this.movie}) : super(key: key);

  @override
  State<DetailedMoviePage> createState() => _DetailedMoviePageState();
}

class _DetailedMoviePageState
    extends BaseState<DetailedMoviePage, DetailedMoviebloc> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }

  @override
  getBlocInstance() => DetailedMoviebloc(Injector().provideMoviesDataUseCase());
}
