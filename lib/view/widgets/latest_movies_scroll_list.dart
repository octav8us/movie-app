import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/bloc/movies_bloc.dart';
import 'package:movies_app/view/widgets/latest_movies_card.dart';

class LatestMoviesScrollList extends StatelessWidget {
  const LatestMoviesScrollList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) {
        if (current.request == MoviesRequest.latestMovies) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if (state is MoviesError
            ) {
          return  Center(
            child: Text("error: ${state.message}"),
          );
        } else if (state is MoviesLoading ) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.builder(
            itemCount: BlocProvider.of<MoviesBloc>(context).latestMovies.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return LatestMoviesCard(
                movie: BlocProvider.of<MoviesBloc>(context).latestMovies[index],
              );
            },
          );
        }
      },
    );
  }
}
