class OMDBMovieRating {
  static const String FIELD_SOURCE = 'source';
  static const String FIELD_VALUE = 'value';

  final String source;
  final String value;

  OMDBMovieRating({this.source, this.value});

  OMDBMovieRating.fromJson(Map<String, dynamic> json)
      : source = json[FIELD_SOURCE],
        value = json[FIELD_VALUE];

}
