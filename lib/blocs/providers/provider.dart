import 'package:leal_test_by_javier_melo/blocs/detailed_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/detailed_movie_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/favourites_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/home_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/login_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/movies_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/providers/bloc_cache.dart';
import 'package:leal_test_by_javier_melo/blocs/recents_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/search_bloc.dart';
import 'package:leal_test_by_javier_melo/blocs/splash_bloc.dart';
import 'bloc.dart';

class Provider {
  static T? of<T extends Bloc?>(Function instance) {
    switch (T) {
      case LoginBloc:
        {
          return BlocCache.getBlocInstance("LoginBloc", instance) as T?;
        }
      case SplashBloc:
        {
          return BlocCache.getBlocInstance("SplashBloc", instance) as T?;
        }
      case Homebloc:
        {
          return BlocCache.getBlocInstance("Homebloc", instance) as T?;
        }
      case MoviesBloc:
        {
          return BlocCache.getBlocInstance("MoviesBloc", instance) as T?;
        }
      case FavouritesBloc:
        {
          return BlocCache.getBlocInstance("FavouritesBloc", instance) as T?;
        }
      case Detailedbloc:
        {
          return BlocCache.getBlocInstance("Detailedbloc", instance) as T?;
        }
      case Recentsbloc:
        {
          return BlocCache.getBlocInstance("Recentsbloc", instance) as T?;
        }
      case Searchbloc:
        {
          return BlocCache.getBlocInstance("Searchbloc", instance) as T?;
        }
      case DetailedMoviebloc:
        {
          return BlocCache.getBlocInstance("DetailedMoviebloc", instance) as T?;
        }
    }
    return null;
  }

  static void dispose<T extends Bloc>() {
    switch (T) {
      case LoginBloc:
        {
          BlocCache.dispose("LoginBloc");
          break;
        }
      case SplashBloc:
        {
          BlocCache.dispose("SplashBloc");
          break;
        }
      case Homebloc:
        {
          BlocCache.dispose("Homebloc");
          break;
        }
      case MoviesBloc:
        {
          BlocCache.dispose("MoviesBloc");
          break;
        }
      case FavouritesBloc:
        {
          BlocCache.dispose("FavouritesBloc");
          break;
        }
      case Detailedbloc:
        {
          BlocCache.dispose("Detailedbloc");
          break;
        }
      case Recentsbloc:
        {
          BlocCache.dispose("Recentsbloc");
          break;
        }
      case Searchbloc:
        {
          BlocCache.dispose("Searchbloc");
          break;
        }
      case DetailedMoviebloc:
        {
          BlocCache.dispose("DetailedMoviebloc");
          break;
        }
    }
  }
}
