import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:meta/meta.dart';

class OMDBMovieShortInfo extends OMDBMovieShortInfoEntity {

  static const String FIELD_TITLE = 'Title';
  static const String FIELD_YEAR = 'Year';
  static const String FIELD_IMDB_ID = 'imdbID';
  static const String FIELD_TYPE = 'Type';
  static const String FIELD_POSTER = 'Poster';

  OMDBMovieShortInfo({
    @required title,
    @required year,
    @required imdbID,
    @required type,
    @required poster
  }) : super(
    title: title,
    year: year,
    imdbID: imdbID,
    type:type,
    poster:poster
  );

  OMDBMovieShortInfo.fromJson(Map<String, dynamic> json)
      : super(
          title : json[FIELD_TITLE],
          year : json[FIELD_YEAR],
          imdbID : json[FIELD_IMDB_ID],
          type : json[FIELD_TYPE],
          poster : json[FIELD_POSTER],
      );

}