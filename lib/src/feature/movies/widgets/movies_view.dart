import 'dart:ui';

import 'package:cine_app/src/core/constant/app_text_styles.dart';
import 'package:cine_app/src/feature/movie/movie_page.dart';
import 'package:flutter/material.dart';

import '../../../core/data/data.dart';

class MoviesView extends StatefulWidget {
  const MoviesView({Key? key}) : super(key: key);

  @override
  State<MoviesView> createState() => _MoviesViewState();
}

class _MoviesViewState extends State<MoviesView> {
  late final PageController _movieCardPageController;
  late final PageController _movieDetailPageController;

  double _movieCardPage = 0;
  double _movieDetailPage = 0;
  int _movieCardIndex = 0;
  final _showMovieDetails = ValueNotifier(false);

  @override
  void initState() {
    _movieCardPageController = PageController(viewportFraction: 0.77)
      ..addListener(_movieCardPagePercentListener);
    _movieDetailPageController = PageController()
      ..addListener(_movieDetailsPagePercentListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;
        return Column(
          children: [
            const Spacer(),
            // *Movie Card
            SizedBox(
              height: h * 0.6,
              child: PageView.builder(
                controller: _movieCardPageController,
                clipBehavior: Clip.none,
                onPageChanged: (page) {
                  _movieDetailPageController.animateToPage(
                    page,
                    duration: const Duration(milliseconds: 550),
                    curve: Curves.decelerate,
                  );
                },
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final progress = (_movieCardPage - index);
                  final scale = lerpDouble(1, .5, progress.abs())!;
                  final isScrolling = _movieCardPageController
                      .position.isScrollingNotifier.value;
                  final isCurrentPage = index == _movieCardIndex;
                  final isFirstPage = index == 0;

                  return Transform.scale(
                      alignment: Alignment.lerp(
                        Alignment.topLeft,
                        Alignment.center,
                        -progress,
                      ),
                      scale: isScrolling && isFirstPage ? 1 - progress : scale,
                      child: GestureDetector(
                        onTap: () {
                          _showMovieDetails.value = !_showMovieDetails.value;
                          const transitionDuration =
                              Duration(milliseconds: 550);
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              transitionDuration: transitionDuration,
                              reverseTransitionDuration: transitionDuration,
                              pageBuilder: (_, animation, ___) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: MoviePage(movie: movie),
                                );
                              },
                            ),
                          );
                          Future.delayed(transitionDuration, () {
                            _showMovieDetails.value = !_showMovieDetails.value;
                          });
                        },
                        child: Hero(
                          tag: movie.image,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            transform: Matrix4.identity()
                              ..translate(
                                isCurrentPage ? 0.0 : -80.0,
                                isCurrentPage ? 0.0 : 60.0,
                              ),
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(70),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  blurRadius: 25,
                                  offset: const Offset(0, 25),
                                  color: Colors.black.withOpacity(.2),
                                ),
                              ],
                              image: DecorationImage(
                                image: AssetImage(movie.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ));
                },
              ),
            ),
            const Spacer(),
            // *Movie Detail
            SizedBox(
              height: h * 0.25,
              child: PageView.builder(
                controller: _movieDetailPageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  final opacity =
                      (index - _movieDetailPage).clamp(0, 1).toDouble();
                  return Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                    child: Opacity(
                      opacity: 1 - opacity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: movie.name,
                            child: Material(
                              type: MaterialType.transparency,
                              child: Text(
                                movie.name.toUpperCase(),
                                style: AppTextStyles.movieNameTextStyle,
                              ),
                            ),
                          ),
                          ValueListenableBuilder<bool>(
                            valueListenable: _showMovieDetails,
                            builder: (context, showMovieDetail, child) {
                              return Visibility(
                                  child: child!, visible: showMovieDetail);
                            },
                            child: Text(
                              movie.actors.join(", "),
                              style: AppTextStyles.movieDetails,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }

  _movieCardPagePercentListener() {
    setState(() {
      _movieCardPage = _movieCardPageController.page!;
      _movieCardIndex = _movieCardPageController.page!.round();
    });
  }

  _movieDetailsPagePercentListener() {
    setState(() {
      _movieDetailPage = _movieDetailPageController.page!;
    });
  }

  @override
  void dispose() {
    _movieCardPageController
      ..removeListener(() {
        _movieCardPagePercentListener();
      })
      ..dispose();

    _movieDetailPageController
      ..removeListener(() {
        _movieDetailsPagePercentListener();
      })
      ..dispose();
    super.dispose();
  }
}
