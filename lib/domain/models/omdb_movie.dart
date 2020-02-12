import 'package:demo_app/common/models/data_context.dart';
import 'package:demo_app/domain/models/omdb_movie_rating.dart';

class OMDBMovie extends DataContext {
  static const String FIELD_TITLE = 'Title';
  static const String FIELD_YEAR = 'Year';
  static const String FIELD_RELEASED = 'Released';
  static const String FIELD_GENRE = 'Genre';
  static const String FIELD_PLOT = 'Plot';
  static const String FIELD_POSTER = 'Poster';
  static const String FIELD_IMDB_RATING = 'imdbRating';
  static const String FIELD_RATINGS = 'Ratings';
  static const String FIELD_RESPONSE = 'Response';

  final String title;
  final String year;
  final String released;
  final String genre;
  final String plot;
  final String poster;
  final String imdbRating;
  final List<OMDBMovieRating> ratings;
  final String response;

  OMDBMovie(
      {this.title,
      this.year,
      this.released,
      this.genre,
      this.plot,
      this.poster,
      this.imdbRating,
      this.ratings,
      this.response});

  OMDBMovie.fromJson(Map<String, dynamic> json)
      : title = json[FIELD_TITLE],
        year = json[FIELD_YEAR],
        this.released = json[FIELD_RELEASED],
        this.genre = json[FIELD_GENRE],
        this.plot = json[FIELD_PLOT],
        this.poster = json[FIELD_POSTER],
        this.imdbRating = json[FIELD_IMDB_RATING],
        this.ratings = json[FIELD_RATINGS] ?? _ratingsFromJson(json[FIELD_RATINGS]),
        this.response = json[FIELD_RESPONSE];

  static List<OMDBMovieRating> _ratingsFromJson(List<dynamic> jsonList) {
    List<OMDBMovieRating> ratingList = List<OMDBMovieRating>();
    for(Map<String, dynamic> json in jsonList) {
      ratingList.add(OMDBMovieRating.fromJson(json));
    }
    return ratingList;
  }

}
