class OMDBMovieShortInfo {

  static const String FIELD_TITLE = 'Title';
  static const String FIELD_YEAR = 'Year';
  static const String FIELD_IMDB_ID = 'imdbID';
  static const String FIELD_TYPE = 'Type';
  static const String FIELD_POSTER = 'Poster';

  final String title;
  final String year;
  final String imdbID;
  final String type;
  final String poster;

  OMDBMovieShortInfo({this.title, this.year, this.imdbID, this.type,
    this.poster});

  OMDBMovieShortInfo.fromJson(Map<String, dynamic> json)
      : title = json[FIELD_TITLE],
        year = json[FIELD_YEAR],
        imdbID = json[FIELD_IMDB_ID],
        type = json[FIELD_TYPE],
        poster = json[FIELD_POSTER];

}