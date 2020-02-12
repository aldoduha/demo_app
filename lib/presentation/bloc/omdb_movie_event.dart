
part of '../bloc/omdb_movie_bloc.dart';

@immutable
abstract class OMDBMovieEvent {}

@immutable
class OMDBMovieSearchEvent extends OMDBMovieEvent {
  final String searchContent;

  OMDBMovieSearchEvent({@required this.searchContent});

}
