import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelty/common/theming/constants.dart';

class GreetingsBanner extends StatefulWidget {
  const GreetingsBanner({super.key});

  @override
  State<GreetingsBanner> createState() => _GreetingsBannerState();
}

class _GreetingsBannerState extends State<GreetingsBanner> {
  @override
  Widget build(BuildContext context) {
    return banner();
  }

  Widget banner() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: novPrimaryBodyMargin,
      ),
      child: Column(
        children: [
          Text(
            'Happy reading, Joshua',
            style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontFamily: "TT Ramillas",
                  height: 1.45,
                ),
          ),
          const SizedBox(height: novTitleMargin),
          Text(
            'Don\'t let the story end just yet. Continue to immerse yourself in the world of literature',
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  height: 1.8,
                ),
          ),
          const SizedBox(height: novPrimaryBodyMargin),
          button(),
        ],
      ),
    );
  }

  Widget button() {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            backgroundColor: Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
            iconColor: Colors.white,
          ),
          child: const Row(
            children: [
              Text(
                'Continue Reading',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Icon(
                CupertinoIcons.arrow_up_right,
                size: 20,
              )
            ],
          ),
        ),
      ],
    );
  }
}
