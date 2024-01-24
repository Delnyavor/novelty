import 'package:flutter/material.dart';
import 'package:novelty/common/theming/constants.dart';

class BookInfo extends StatelessWidget {
  final String title;
  final String description;
  final TextStyle? style;
  const BookInfo(
      {super.key, required this.title, required this.description, this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        titleWidget(),
        const SizedBox(height: novTitleMargin),
        descriptionWidget(),
      ],
    );
  }

  Widget titleWidget() {
    return Text(
      title,
      style: const TextStyle(
          height: 2.5,
          fontSize: 13,
          color: Colors.black87,
          fontWeight: FontWeight.bold),
    );
  }

  Widget descriptionWidget() {
    return Text(
      description,
      style: style ??
          const TextStyle(
            height: 2,
            fontSize: 12,
            color: Colors.black87,
          ),
    );
  }
}
