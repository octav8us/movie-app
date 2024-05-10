part of 'movies_bloc.dart';

abstract class MoviesEvent extends Equatable {
  const MoviesEvent();

  @override
  List<Object> get props => [];
}

class FetchPopularMovies extends MoviesEvent {
  const FetchPopularMovies();

  @override
  List<Object> get props => [];
}
class FetchLatestMovies extends MoviesEvent {
  const FetchLatestMovies();

  @override
  List<Object> get props => [];
}
