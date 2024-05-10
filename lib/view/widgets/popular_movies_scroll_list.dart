import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/bloc/movies_bloc.dart';
import 'package:movies_app/view/widgets/popular_movies_card.dart';

class PopularMoviesScrollList extends StatelessWidget {
  const PopularMoviesScrollList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      buildWhen: (previous, current) {
        if (current.request == MoviesRequest.popularMovies) {
          return true;
        }
        return false;
      },
      builder: (context, state) {
        if(state is MoviesError){
           return  Center(
            child: Text("error: ${state.message}"),
          );
        }
        if (state is MoviesLoaded) {
          return CustomScrollView(
            slivers: <Widget>[
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Popular",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ),
              ),
              SliverOverlapInjector(
                handle: NestedScrollView.sliverOverlapAbsorberHandleFor(
                  context,
                ),
              ),
              SliverFixedExtentList(
                itemExtent: 150.h,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) => PopularMoviesCard(
                      movie: BlocProvider.of<MoviesBloc>(context)
                          .popularMovies[index]),
                  childCount:
                      BlocProvider.of<MoviesBloc>(context).popularMovies.length,
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
