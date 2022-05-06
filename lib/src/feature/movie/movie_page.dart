import 'package:flutter/material.dart';

import '../../core/data/models/models.dart';

class MoviePage extends StatelessWidget {
  const MoviePage({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(movie.name),
      ),
    );
  }
}
