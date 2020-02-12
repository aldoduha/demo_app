
import 'package:demo_app/datasource/omdb_movie_remote_data_source_impl.dart';
import 'package:demo_app/domain/models/omdb_movie.dart';
import 'package:demo_app/domain/models/omdb_movie_short_info.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(OMDBMovieRemoteDataSourceImpl)
@injectable
abstract class OMDBMovieRemoteDataSource {
  Future<List<OMDBMovieShortInfo>> searchMovie({String contentSearch});
  Future<OMDBMovie> findMovieByTitle(String title);
}

