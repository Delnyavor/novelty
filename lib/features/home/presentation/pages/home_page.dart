import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:novelty/common/theming/constants.dart';
import 'package:novelty/features/home/presentation/widgets/components/greeting_banner.dart';
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
      backgroundColor: Colors.transparent,
      appBar: appBar(),
      body: ListView(
          padding: const EdgeInsets.only(bottom: 20, top: 10),
          children: const [
            GreetingsBanner(),
            SizedBox(height: novPrimaryBodyMargin),
            PopularBooksList(bookList: [])
          ]),
    );
  }

  Widget searchbar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
      child: TextField(
        maxLines: 1,
        textAlignVertical: TextAlignVertical.center,
        // cursorHeight: 12,
        cursorWidth: 1.5,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
            fontWeight: FontWeight.normal, fontSize: 12, color: Colors.black87),
        decoration: InputDecoration(
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.tertiary.withOpacity(0.5),
                width: 0.5),
          ),
          hintText: 'Search book name, author ...',
          hintStyle: Theme.of(context)
              .textTheme
              .labelSmall!
              .copyWith(fontWeight: FontWeight.normal, color: Colors.black45),
          contentPadding: const EdgeInsets.symmetric(
              vertical: 15, horizontal: novPrimaryBodyMargin),
          prefixIcon: const Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              CupertinoIcons.search,
              size: 18,
            ),
          ),
          prefixIconConstraints: const BoxConstraints(maxWidth: 30),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor:
          Theme.of(context).colorScheme.surfaceTint.withOpacity(0.01),
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.search,
          size: 22,
        ),
      ),
      actions: <Widget>[
        notification(),
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
          radius: 12,
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
