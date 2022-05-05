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
  final _showMovieDetail = ValueNotifier(false);

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
                itemCount: movies.length,
                itemBuilder: (context, index) {
                  final movie = movies[index];
                  return Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(movie.image),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(70),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 25,
                            offset: const Offset(0, 25),
                          )
                        ]),
                  );
                },
              ),
            ),
            const Spacer(),
            // *Movie Detail
            SizedBox(
              height: h * 0.25,
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
      ..removeListener(_movieCardPagePercentListener())
      ..dispose();

    _movieDetailPageController
      ..removeListener(_movieDetailsPagePercentListener())
      ..dispose();
    super.dispose();
  }
}
