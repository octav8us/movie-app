import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/movie_model.dart';

class LatestMoviesCard extends StatelessWidget {
  final MovieModel movie;

  const LatestMoviesCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      shadowColor: Colors.transparent,
      margin: EdgeInsets.all(8.w),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(25),
            clipBehavior: Clip.antiAlias,
            child: Image.network(
              movie.fullPosterPath,
              cacheHeight: 225.h.toInt(),
              cacheWidth: 150.w.toInt(),
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            movie.title,
            style: Theme.of(context).textTheme.bodyMedium,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            movie.releaseDate,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Colors.grey,
                ),
          ),
          
        ],
      ),
    );
  }
}
