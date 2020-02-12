
import 'package:demo_app/datasource/omdb_movie_remote_data_source.dart';
import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/domain/models/omdb_movie.dart';
import 'package:demo_app/domain/repository/omdb_movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class OMDBMovieRepositoryImpl implements OMDBMovieRepository {

  final OMDBMovieRemoteDataSource omdbMovieRemoteDataSource;

  OMDBMovieRepositoryImpl({@required this.omdbMovieRemoteDataSource});

  @override
  Future<List<OMDBMovieShortInfoEntity>> searchMovie(String contentSearch) async {
    return await omdbMovieRemoteDataSource.searchMovie(contentSearch: contentSearch);
  }

  @override
  Future<OMDBMovie> findMovieByTitle(String title) async {
    return await omdbMovieRemoteDataSource.findMovieByTitle(title);
  }


}