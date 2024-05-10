import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/dependency_injection/get_it.dart';
import 'package:movies_app/core/networking/constants.dart';

import '../model/movie_model.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  MoviesBloc() : super(const MoviesInitial()) {
    on<MoviesEvent>(
      (event, emit) {},
    );
    on<FetchPopularMovies>(
      (event, emit) async {
        await _onFetchPopularMovies(emit);
      },
    );

    on<FetchLatestMovies>((event, emit) async {
      await _onFetchLatestMovies(emit);
    });
  }
  List<MovieModel> latestMovies = [];
  List<MovieModel> popularMovies = [];

  Future<void> _onFetchPopularMovies(Emitter<MoviesState> emit) async {
    emit(const MoviesLoading(request: MoviesRequest.popularMovies));

    try {
      final dio = getIt<Dio>();
      try {
        final response = await dio.get(
          Constants.popularPath,
          options: Options(headers: {
            'Authorization': "Bearer ${Constants.apiKey}",
          }),
        );
        popularMovies = (response.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } catch (e) {
        emit(MoviesError(
            message: e.toString(), request: MoviesRequest.popularMovies));
      }

      emit(const MoviesLoaded(request: MoviesRequest.popularMovies));
    } catch (e) {
      // emit(MoviesError(message: e.toString()));
    }
  }

  Future<void> _onFetchLatestMovies(Emitter<MoviesState> emit) async {
    emit(const MoviesLoading(request: MoviesRequest.latestMovies));

    try {
      final dio = getIt<Dio>();
      try {
        final latestResponse = await dio.get(
          Constants.latestPath,
          options: Options(headers: {
            'Authorization': "Bearer ${Constants.apiKey}",
          }),
        );
        latestMovies = (latestResponse.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
        final popularResponse = await dio.get(
          Constants.popularPath,
          options: Options(headers: {
            'Authorization': "Bearer ${Constants.apiKey}",
          }),
        );
        popularMovies = (popularResponse.data['results'] as List)
            .map((e) => MovieModel.fromJson(e))
            .toList();
      } catch (e) {
        emit(MoviesError(
            message: e.toString(), request: MoviesRequest.latestMovies));
      }

      emit(const MoviesLoaded(request: MoviesRequest.latestMovies));
    } catch (e) {
      emit(MoviesError(
          message: e.toString(), request: MoviesRequest.latestMovies));
    }
  }
}
