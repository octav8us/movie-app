part of 'movies_bloc.dart';

enum MoviesRequest { popularMovies, latestMovies }

abstract class MoviesState extends Equatable {
  final MoviesRequest request;

  const MoviesState({required this.request});

  @override
  List<Object> get props => [request];
}

class MoviesInitial extends MoviesState {
  const MoviesInitial() : super(request: MoviesRequest.popularMovies);
}

class MoviesLoading extends MoviesState {
  const MoviesLoading({required super.request});

  @override
  List<Object> get props => [];
}

class MoviesLoaded extends MoviesState {
  const MoviesLoaded({required super.request});

  @override
  List<Object> get props => [request];
}

class MoviesError extends MoviesState {
  final String message;

  const MoviesError({required this.message, required super.request});

  @override
  List<Object> get props => [message, request];
}
