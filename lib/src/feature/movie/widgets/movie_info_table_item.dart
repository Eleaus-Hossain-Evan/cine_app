import 'package:cine_app/src/core/constant/constant.dart';
import 'package:flutter/material.dart';

class MovieTableInfoItem extends StatelessWidget {
  const MovieTableInfoItem({
    Key? key,
    required this.title,
    required this.content,
  }) : super(key: key);

  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            title,
            style: AppTextStyles.infoTitleStyle,
          ),
        ),
        Text(
          content,
          style: AppTextStyles.infoContentStyle,
        ),
      ],
    );
  }
}
