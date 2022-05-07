import 'package:flutter/material.dart';

import '../../../core/data/models/models.dart';
import '../widgets/widgets.dart';

class MovieInfoTable extends StatelessWidget {
  const MovieInfoTable({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        MovieTableInfoItem(title: "Type", content: movie.type),
        MovieTableInfoItem(title: "Hour", content: '${movie.hours} Hour'),
        MovieTableInfoItem(title: "Director", content: movie.director),
      ],
    );
  }
}
