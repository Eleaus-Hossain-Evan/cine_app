import 'package:cine_app/src/core/data/data.dart';
import 'package:flutter/material.dart';

class MovieSeatTypeLegend extends StatelessWidget {
  const MovieSeatTypeLegend({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: seatTypes
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    SizedBox(
                      width: 12,
                      height: 12,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: e.color,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 7),
                      child: Text(e.name),
                    )
                  ],
                ),
              ))
          .toList(),
    );
  }
}
