import 'package:cine_app/src/core/data/models/models.dart';
import 'package:cine_app/src/feature/booking/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({Key? key, required this.movie}) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final w = constraints.maxWidth;
        final h = constraints.maxHeight;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(kToolbarHeight),
            child: MovieAppBar(title: movie.name),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Positioned(
                width: w,
                height: h * .885,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: SizedBox(
                        height: h * .075,
                        child: MovieDates(dates: movie.dates),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
