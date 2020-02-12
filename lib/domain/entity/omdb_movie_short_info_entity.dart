import 'package:meta/meta.dart';

class OMDBMovieShortInfoEntity {

  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  OMDBMovieShortInfoEntity({
    @required this.title,
    @required this.year,
    @required this.imdbID,
    @required this.type,
    @required this.poster
  });

  OMDBMovieShortInfoEntity.copyWith({
    String title,
    String year,
    String imdbID,
    String type,
    String poster
  }) :
        this.title = title,
        this.year = year,
        this.imdbID = imdbID,
        this.type = type,
        this.poster = poster;


}