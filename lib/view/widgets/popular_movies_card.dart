import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/helpers/format_date.dart';

import '../../model/movie_model.dart';

class PopularMoviesCard extends StatelessWidget {
  final MovieModel movie;

  const PopularMoviesCard({super.key, required this.movie});

@override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        SizedBox(
          height: 122.h,
          width: 380.w,
          child: Card(
            color: Colors.transparent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            child: Row(
              children: [
                SizedBox(
                  width: 16.w,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  clipBehavior: Clip.antiAlias,
                  child: Image.network(
                    movie.fullPosterPath,
                    cacheHeight: 100.h.toInt(),
                    cacheWidth: 67.w.toInt(),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(movie.title),
                      Text(
                        formatDate(movie.releaseDate),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.timelapse_outlined,
                            color: Colors.white,
                            size: 14,
                          ),
                          Text(
                            "  2h , 30m",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
        Positioned(
            right: 30,
            top: 7,
            child: Container(
              height: 70.h,
              width: 40.w,
              decoration: const BoxDecoration(
                color: Color(0xffFFB039),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.star,
                    size: 14,
                  ),
                  Center(
                    child: Text(
                      movie.voteAverage.toStringAsPrecision(2),
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }
}
