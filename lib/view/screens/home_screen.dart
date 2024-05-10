import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/bloc/movies_bloc.dart';

import '../../core/widgets/custom_gradient.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/latest_movies_scroll_list.dart';
import '../widgets/message_and_avatar.dart';
import '../widgets/popular_movies_scroll_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    if (context.mounted) {
      BlocProvider.of<MoviesBloc>(context).add(const FetchPopularMovies());
      BlocProvider.of<MoviesBloc>(context).add(const FetchLatestMovies());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomGradient(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        drawer: const CustomDrawer(),
        appBar: CustomAppBar(context),
        body: const HomeBody(),
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: NestedScrollView(headerSliverBuilder:
            (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 8,
                      ),
                      const MessageAndAvatar(),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Latest",
                        style:
                            Theme.of(context).textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                      ),
                      SizedBox(
                        height: 300.h,
                        child: const LatestMoviesScrollList(),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ];
        }, body: Builder(builder: (BuildContext context) {
          return const PopularMoviesScrollList();
        })));
  }
}
