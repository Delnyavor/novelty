import 'package:flutter/material.dart';

class BgColorImage extends StatefulWidget {
  final String networkImage;
  final BoxFit fit;
  const BgColorImage(
      {super.key, required this.networkImage, this.fit = BoxFit.contain});

  @override
  State<BgColorImage> createState() => BgColorImageState();
}

class BgColorImageState extends State<BgColorImage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return colouredBackground();
  }

  Widget colouredBackground(
      [bool hasColor = false, Color color = Colors.white]) {
    return Container(
      color: color,
      child: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Colors.black.withOpacity(0.05), Colors.black26],
              // colors: [Colors.transparent, Colors.black12],
              stops: const [0, 1],
            ),
          ),
          child: networkImage()),
    );
  }

  Widget networkImage() {
    return AspectRatio(
      aspectRatio: 1,
      child: DecoratedBox(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(widget.networkImage), fit: widget.fit),
        ),
      ),
    );
  }
}
