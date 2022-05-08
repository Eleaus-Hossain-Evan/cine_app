import 'package:cine_app/src/core/data/models/models.dart';
import 'package:cine_app/src/feature/booking/widgets/movie_date_card.dart';
import 'package:flutter/material.dart';

class MovieDates extends StatefulWidget {
  const MovieDates({Key? key, required this.dates}) : super(key: key);

  final List<MovieDate> dates;

  @override
  State<MovieDates> createState() => _MovieDatesState();
}

class _MovieDatesState extends State<MovieDates> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      clipBehavior: Clip.none,
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      itemCount: widget.dates.length,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(
          width: 10,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
          },
          child: MovieDateCard(
            date: widget.dates[index],
            isSelected: index == _selectedIndex,
          ),
        );
      },
    );
  }
}
