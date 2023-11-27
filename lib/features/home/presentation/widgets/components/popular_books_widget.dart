import 'package:flutter/material.dart';
import 'package:novelty/features/home/presentation/widgets/components/image.dart';

class PopularBooksWidget extends StatefulWidget {
  // Receive a book instead
  final String image;
  const PopularBooksWidget({super.key, required this.image});

  @override
  State<PopularBooksWidget> createState() => _PopularBooksWidgetState();
}

class _PopularBooksWidgetState extends State<PopularBooksWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // viewProduct(context, index);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: SizedBox.fromSize(
          size: const Size.fromHeight(70),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              imageWidget(),
              descriptors(),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(6),
      child: BgColorImage(
        networkImage: widget.image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget descriptors() => const Padding(
        padding: EdgeInsets.fromLTRB(8, 0, 0, 8),
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
