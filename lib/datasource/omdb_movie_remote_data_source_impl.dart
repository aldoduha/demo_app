
import 'package:demo_app/common/models/data_context.dart';
import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/common/network/network_client_impl.dart';
import 'package:demo_app/domain/models/omdb_movie.dart';
import 'package:demo_app/domain/models/omdb_movie_search_content.dart';
import 'package:demo_app/domain/models/omdb_movie_short_info.dart';
import 'package:demo_app/domain/datahandler/omdb_response_handler.dart';
import 'package:demo_app/domain/models/omdb_response_error.dart';
import 'package:demo_app/util/common_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

import 'omdb_movie_remote_data_source.dart';

@lazySingleton
@injectable
class OMDBMovieRemoteDataSourceImpl implements OMDBMovieRemoteDataSource {
  final NetworkClientImpl client;

  OMDBMovieRemoteDataSourceImpl({this.client});

  factory OMDBMovieRemoteDataSourceImpl.create() {
    return OMDBMovieRemoteDataSourceImpl(
      client: NetworkClientImpl.init(http.Client()),
    );
  }

  @override
  Future<List<OMDBMovieShortInfo>> searchMovie(
      {@required String contentSearch}) async {
    String url = CommonConstants.API_SEARCH_MOVIE;
    ResponseHandler responseHandler =
    OMDBResponseHandler(filter: CommonConstants.FILTER_BY_SEARCH);

    final DataContext dataContext = await client.get(url, responseHandler);

    if(dataContext is OMDBMovieSearchContent) {
      return dataContext.oMDBMovieShortInfoList;
    } else if(dataContext is OMDBResponseError){
      /// TODO : return error message
      ///
      print('Error message = ' + dataContext.errorMessage);
      return List<OMDBMovieShortInfo>();
    }

    return null;
  }

  @override
  Future<OMDBMovie> findMovieByTitle(String title) async {
    String url = CommonConstants.API_SEARCH_BY_TITLE;
    ResponseHandler responseHandler =
    OMDBResponseHandler(filter: CommonConstants.FILTER_BY_TITLE);

    final DataContext dataContext = await client.get(url, responseHandler);

    if(dataContext is OMDBMovie) {
      return dataContext;
    } else if(dataContext is OMDBResponseError){
      /// TODO : return error message
      ///
      print('Error message = ' + dataContext.errorMessage);
      return OMDBMovie();
    }

    return null;
  }

}
