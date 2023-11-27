import 'package:flutter/material.dart';
import 'package:novelty/features/home/presentation/widgets/components/image.dart';

class CurrentlyReadingWidget extends StatefulWidget {
  // Receive a book instead
  final String image;
  const CurrentlyReadingWidget({super.key, required this.image});

  @override
  State<CurrentlyReadingWidget> createState() => _CurrentlyReadingWidgetState();
}

class _CurrentlyReadingWidgetState extends State<CurrentlyReadingWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // viewProduct(context, index);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          imageWidget(),
          descriptors(),
        ],
      ),
    );
  }

  Widget imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: AspectRatio(
        aspectRatio: 1 / 1,
        child: BgColorImage(
          networkImage: widget.image,
        ),
      ),
    );
  }

  Widget descriptors() => const Padding(
        padding: EdgeInsets.fromLTRB(0, 8, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Book Title',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                // fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 12,
                letterSpacing: 0.1,
              ),
            ),
            Text(
              'Book Author or Publisher',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                color: Colors.black54,
                fontSize: 12,
                letterSpacing: 0.1,
              ),
            )
          ],
        ),
      );
}
