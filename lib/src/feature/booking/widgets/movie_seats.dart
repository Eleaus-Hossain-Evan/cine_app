import 'package:cine_app/src/feature/booking/widgets/movie_seat_section.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/models.dart';

class MovieSeats extends StatelessWidget {
  const MovieSeats({Key? key, required this.seats}) : super(key: key);

  final List<List<Seat>> seats;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            for (var i = 0; i < 3; i++)
              MovieSeatSection(
                seats: seats[i],
                isFront: true,
              )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          children: [
            for (var i = 3; i < 6; i++)
              MovieSeatSection(
                seats: seats[i],
                isFront: true,
              )
          ],
        )
      ],
    );
  }
}
