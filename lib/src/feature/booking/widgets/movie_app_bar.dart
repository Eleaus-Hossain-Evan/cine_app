import 'package:flutter/material.dart';

class MovieAppBar extends StatelessWidget {
  const MovieAppBar({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(),
      title: Text(title),
    );
  }
}
