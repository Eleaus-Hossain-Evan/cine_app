import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        borderRadius: const BorderRadius.all(
          Radius.circular(70),
        ),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: const Offset(0, 20),
            color: Colors.black.withOpacity(.2),
          ),
        ],
      ),
    );
  }
}