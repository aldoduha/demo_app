
part of 'omdb_movie_bloc.dart';

@immutable
abstract class OMDBMovieState {
  const OMDBMovieState();
}

@immutable
class OMDBMovieInitialState extends OMDBMovieState {
  const OMDBMovieInitialState();
}

@immutable
class OMDBMovieDataState extends OMDBMovieState with EquatableMixin {
  final List<OMDBMovieShortInfoEntity> omdbMovieList;

  OMDBMovieDataState({this.omdbMovieList});

  @override
  List<Object> get props => [omdbMovieList];
}
