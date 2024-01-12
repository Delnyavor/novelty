import 'package:flutter/material.dart';
import 'package:novelty/common/routes/navigator_keys.dart';
import 'package:novelty/common/routes/routes.dart';

class PopularBooksWidget extends StatefulWidget {
  // Receive a book instead
  final String image;
  final String title;
  const PopularBooksWidget(
      {super.key, required this.image, required this.title});

  @override
  State<PopularBooksWidget> createState() => _PopularBooksWidgetState();
}

class _PopularBooksWidgetState extends State<PopularBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed(AppRoutes.viewBookDetails,
            arguments: {"name": widget.title});
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          imageWidget(),
          const SizedBox(height: 20),
          descriptors(),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return DecoratedBox(
      decoration: const BoxDecoration(
        boxShadow: [
          BoxShadow(
            spreadRadius: -12,
            blurRadius: 6,
            offset: Offset(-15, 15),
            color: Colors.black12,
          ),
          BoxShadow(
            spreadRadius: -10,
            blurRadius: 8,
            offset: Offset(-20, 22),
            color: Colors.black26,
          ),
        ],
      ),
      child: AspectRatio(
        aspectRatio: 1 / 1.5,
        child: Image.network(
          widget.image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget descriptors() => Padding(
        padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              widget.title,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black87,
                // fontWeight: FontWeight.bold,
                fontSize: 12,
                letterSpacing: 0.1,
                height: 1.5,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
}
