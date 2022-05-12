import 'package:cine_app/src/core/constant/app_colors.dart';
import 'package:cine_app/src/core/data/models/models.dart';
import 'package:flutter/material.dart';

class MovieSeatBox extends StatefulWidget {
  const MovieSeatBox({
    Key? key,
    required this.seat,
  }) : super(key: key);

  final Seat seat;

  @override
  State<MovieSeatBox> createState() => _MovieSeatBoxState();
}

class _MovieSeatBoxState extends State<MovieSeatBox> {
  @override
  Widget build(BuildContext context) {
    final color = widget.seat.isHidden
        ? Colors.white
        : widget.seat.isOccupied
            ? Colors.black
            : widget.seat.isSelected
                ? AppColors.primaryColor
                : Colors.grey.shade200;
    return GestureDetector(
      onTap: () {
        widget.seat.isSelected = !widget.seat.isSelected;
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(3),
        ),
      ),
    );
  }
}
