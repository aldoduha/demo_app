
import 'package:demo_app/common/models/use_case.dart';
import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/domain/repository/omdb_movie_repository.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
@injectable
class SearchOMDBMovieUseCase implements UseCase<List<OMDBMovieShortInfoEntity>, String> {

  final OMDBMovieRepository omdbMovieRepository;

  SearchOMDBMovieUseCase({@required this.omdbMovieRepository});

  @override
  Future<List<OMDBMovieShortInfoEntity>> call(String contentSearch) {
    return omdbMovieRepository.searchMovie(contentSearch);
  }

}