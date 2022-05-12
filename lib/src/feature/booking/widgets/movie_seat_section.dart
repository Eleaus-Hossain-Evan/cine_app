import 'package:cine_app/src/feature/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../core/data/models/models.dart';

class MovieSeatSection extends StatelessWidget {
  const MovieSeatSection({
    Key? key,
    required this.seats,
    this.isFront = false,
  }) : super(key: key);

  final List<Seat> seats;
  final bool isFront;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: isFront ? 16 : 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 5,
          crossAxisSpacing: 8,
        ),
        itemBuilder: (BuildContext context, int index) {
          final seat = seats[index];
          return MovieSeatBox(seat: seat);
        },
      ),
    );
  }
}
