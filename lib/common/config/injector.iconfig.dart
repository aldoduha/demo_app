// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:demo_app/common/network/base_network_client.dart';
import 'package:http/src/client.dart';
import 'package:demo_app/common/network/network_client_impl.dart';
import 'package:demo_app/datasource/omdb_movie_remote_data_source.dart';
import 'package:demo_app/datasource/omdb_movie_remote_data_source_impl.dart';
import 'package:demo_app/domain/repository/omdb_movie_repository.dart';
import 'package:demo_app/domain/repository/omdb_movie_repository_impl.dart';
import 'package:demo_app/domain/usecases/search_omdb_movie_usecase.dart';
import 'package:demo_app/presentation/bloc/omdb_movie_bloc.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void $initGetIt({String environment}) {
  getIt
    ..registerFactory<BaseNetworkClient>(
        () => NetworkClientImpl(getIt<Client>()))
    ..registerLazySingleton<NetworkClientImpl>(
        () => NetworkClientImpl(getIt<Client>()))
    ..registerFactory<OMDBMovieRemoteDataSource>(
        () => OMDBMovieRemoteDataSourceImpl(client: getIt<NetworkClientImpl>()))
    ..registerLazySingleton<OMDBMovieRemoteDataSourceImpl>(
        () => OMDBMovieRemoteDataSourceImpl(client: getIt<NetworkClientImpl>()))
    ..registerFactory<OMDBMovieRepository>(() => OMDBMovieRepositoryImpl(
        omdbMovieRemoteDataSource: getIt<OMDBMovieRemoteDataSource>()))
    ..registerLazySingleton<OMDBMovieRepositoryImpl>(() =>
        OMDBMovieRepositoryImpl(
            omdbMovieRemoteDataSource: getIt<OMDBMovieRemoteDataSource>()))
    ..registerLazySingleton<SearchOMDBMovieUseCase>(() =>
        SearchOMDBMovieUseCase(
            omdbMovieRepository: getIt<OMDBMovieRepository>()))
    ..registerFactory<OMDBMovieBloc>(() =>
        OMDBMovieBloc(searchOMDBMovieUseCase: getIt<SearchOMDBMovieUseCase>()));
}
