import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:demo_app/domain/entity/omdb_movie_short_info_entity.dart';
import 'package:demo_app/domain/usecases/search_omdb_movie_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'omdb_movie_event.dart';
part 'omdb_movie_state.dart';

@injectable
class OMDBMovieBloc extends Bloc<OMDBMovieEvent, OMDBMovieState> {

  final SearchOMDBMovieUseCase searchOMDBMovieUseCase;

  OMDBMovieBloc({@required this.searchOMDBMovieUseCase});

  @override
  OMDBMovieState get initialState => const OMDBMovieInitialState();

  @override
  Stream<OMDBMovieState> mapEventToState(OMDBMovieEvent event) async* {

    if(event is OMDBMovieSearchEvent) {
      final omdbMovieList = await searchOMDBMovieUseCase(event.searchContent);
      yield OMDBMovieDataState(omdbMovieList: omdbMovieList);
    }

  }



}