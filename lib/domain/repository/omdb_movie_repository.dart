
import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/domain/models/omdb_movie.dart';
import 'package:demo_app/domain/repository/omdb_movie_repository_impl.dart';
import 'package:injectable/injectable.dart';

@Bind.toType(OMDBMovieRepositoryImpl)
@injectable
abstract class OMDBMovieRepository {

  Future<List<OMDBMovieShortInfoEntity>> searchMovie(String contentSearch);

  Future<OMDBMovie> findMovieByTitle(String title);

}