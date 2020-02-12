import 'package:demo_app/common/models/data_context.dart';

import 'omdb_movie_short_info.dart';

class OMDBMovieSearchContent extends DataContext{
  static const String FIELD_SEARCH = 'Search';
  static const String FIELD_TOTAL_RESULT = 'totalResults';
  static const String FIELD_RESPONSE = 'Response';

  final List<OMDBMovieShortInfo> _oMDBMovieShortInfoList;
  final String _totalResults;
  final String _response;

  OMDBMovieSearchContent({oMDBMovieShortInfoList, totalResults, response})
      : this._oMDBMovieShortInfoList = oMDBMovieShortInfoList,
        this._totalResults = totalResults,
        this._response = response;

  OMDBMovieSearchContent.fromJson(Map<String, dynamic> json)
      : _oMDBMovieShortInfoList = json[FIELD_SEARCH] == null
            ? List<OMDBMovieShortInfo>()
            : _movieFromJson(json[FIELD_SEARCH]),
        _totalResults = json[FIELD_TOTAL_RESULT],
        _response = json[FIELD_RESPONSE];

  static List<OMDBMovieShortInfo> _movieFromJson(
      List<dynamic> jsonList) {
    List<OMDBMovieShortInfo> movieList = List<OMDBMovieShortInfo>();
    for (Map<String, dynamic> json in jsonList) {
      movieList.add(OMDBMovieShortInfo.fromJson(json));
    }
    return movieList;
  }

  /// === getter ===

  String get response => _response;
  String get totalResults => _totalResults;
  List<OMDBMovieShortInfo> get oMDBMovieShortInfoList =>
      _oMDBMovieShortInfoList;
}
