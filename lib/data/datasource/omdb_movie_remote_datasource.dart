import 'package:demo_app/common/models/data_context.dart';
import 'package:demo_app/common/models/response_handler.dart';
import 'package:demo_app/common/network/network_client_impl.dart';
import 'package:demo_app/data/models/omdb_movie_search_content.dart';
import 'package:demo_app/data/models/omdb_movie_short_info.dart';
import 'package:demo_app/data/models/omdb_response_error.dart';
import 'package:demo_app/data/models/omdb_response_handler.dart';
import 'package:demo_app/util/common_constants.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@Bind.toType(OMDBMovieRemoteDatasourceImpl)
@injectable
abstract class OMDBMovieRemoteDatasource {
  Future<List<OMDBMovieShortInfo>> searchMovie({String contentSearch});
}

@lazySingleton
@injectable
class OMDBMovieRemoteDatasourceImpl implements OMDBMovieRemoteDatasource {
  final NetworkClientImpl client;

  OMDBMovieRemoteDatasourceImpl({this.client});

  factory OMDBMovieRemoteDatasourceImpl.create() {
    return OMDBMovieRemoteDatasourceImpl(
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

}
