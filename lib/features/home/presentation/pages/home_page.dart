import 'dart:math';

import 'package:flutter/material.dart';
import 'package:novelty/common/theming/constants.dart';
import 'package:novelty/features/home/presentation/widgets/lists/currently_reading_widget_list.dart';
import 'package:novelty/features/home/presentation/widgets/lists/popular_books_widget_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: ListView(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          children: [
            searchbar(),
            const SizedBox(height: 16),
            const CurrentlyReadingList(bookList: []),
            const PopularBooksList(bookList: [])
          ]),
    );
  }

  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: TextField(
          maxLines: 1,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: Theme.of(context)
                .textTheme
                .labelSmall!
                .copyWith(fontWeight: FontWeight.normal, color: Colors.black45),
            contentPadding: const EdgeInsets.symmetric(
                vertical: 0, horizontal: novPrimaryBodyMargin),
            prefixIcon: const Icon(Icons.search),
            filled: true,
            // fillColor: Theme.of(context).colorScheme.,
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.sort,
          size: 24,
        ),
      ),
      actions: <Widget>[
        // notification(),
        profile(),
      ],
    );
  }

  Widget profile() {
    return const Padding(
      padding: EdgeInsets.only(right: 13.0, left: 6),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 2,
              spreadRadius: 0,
              offset: Offset(0, 1),
            ),
            BoxShadow(
              color: Colors.black12,
              blurRadius: 3,
              spreadRadius: 1,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: CircleAvatar(
          radius: 18,
          backgroundImage: AssetImage('assets/images/portrait.jpg'),
        ),
      ),
    );
  }

  Widget notification() {
    return Transform.rotate(
      angle: pi * 1.9,
      child: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.notifications_outlined, size: 24),
        //  Icons.notifications_outlined),
      ),
    );
  }
}
