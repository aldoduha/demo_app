import 'package:demo_app/common/models/data_context.dart';
import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/data/models/omdb_movie.dart';
import 'package:demo_app/data/models/omdb_movie_search_content.dart';
import 'package:demo_app/data/models/omdb_response_error.dart';
import 'package:demo_app/util/common_constants.dart';
import 'package:flutter/material.dart';

class OMDBResponseHandler implements ResponseHandler<DataContext> {
  final String filter;

  OMDBResponseHandler({@required this.filter});

  static const String FIELD_RESPONSE = 'Response';
  static const String FIELD_SEARCH = 'Search';

  @override
  DataContext doTransform(Map<String, dynamic> json) {
    if (json[FIELD_RESPONSE] == 'True') {
      return _getObjectMovie(json);
    } else {
      return OMDBResponseError.fromJson(json);
    }
  }

  DataContext _getObjectMovie(Map<String, dynamic> json) {
    switch (filter) {
      case CommonConstants.FILTER_BY_SEARCH:
        return OMDBMovieSearchContent.fromJson(json);
      case CommonConstants.FILTER_BY_TITLE:
        return OMDBMovie.fromJson(json);
      default:
        /// TODO : define error message
        return null;
    }
  }
}
