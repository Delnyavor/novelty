import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:novelty/common/theming/constants.dart';
import 'package:novelty/common/widgets/book_action_icon_buttons.dart';
import 'package:novelty/features/book_details/presentation/widgets/book_info.dart';

class BookDetailsPage extends StatefulWidget {
  final String image;
  final String name;
  const BookDetailsPage({super.key, required this.image, required this.name});
  @override
  createState() => _BookDetailsPage();
}

class _BookDetailsPage extends State<BookDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        // if (await _isExitDesired() && context.mounted) {
        //   exit();
        // }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: true,
          backgroundColor: Colors.transparent,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
          surfaceTintColor: Colors.white,
        ),
        extendBodyBehindAppBar: true,
        body: bookDetails(),
      ),
    );
  }

  Widget bookDetails() {
    return ListView(
      padding: const EdgeInsets.only(left: 32, right: 32, top: 90, bottom: 100),
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: SizedBox(height: 300, child: imageWidget())),
            const SizedBox(height: novPrimaryBodyMargin + 10),
            title(),
            const SizedBox(height: novTitleMargin + 5),
            author(),
            const SizedBox(height: novTitleMargin + 5),
            button(),
          ],
        ),
        const SizedBox(height: novTitleMargin + 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BookActionIconButton(
              icon: CupertinoIcons.bookmark,
              selectedIcon: CupertinoIcons.bookmark_fill,
              isSelected: false,
              onPressed: () {},
            ),
            const SizedBox(width: novPrimaryBodyMargin),
            BookActionIconButton(
              icon: Icons.share,
              isSelected: false,
              onPressed: () {},
            ),
            const SizedBox(width: novPrimaryBodyMargin),
            BookActionIconButton(
              icon: CupertinoIcons.bookmark,
              selectedIcon: CupertinoIcons.bookmark_fill,
              isSelected: false,
              onPressed: () {},
            )
          ],
        ),
        const SizedBox(height: novPrimaryBodyMargin),
        desc(),
        divider(),
        authorSection(),
        divider(),
        editors(),
      ],
    );
  }

  Widget divider() {
    return const Column(
      children: [
        SizedBox(height: novPrimaryBodyMargin * 1.5),
        Divider(height: 0, thickness: 0),
        SizedBox(height: novPrimaryBodyMargin * 1.5),
      ],
    );
  }

  Widget title() {
    return Text(
      widget.name,
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.titleMedium!.copyWith(
            fontFamily: "TT Ramillas",
            height: 1.3,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
    );
  }

  Widget author() {
    return Text(
      'Author Name',
      style: Theme.of(context).textTheme.titleSmall!.copyWith(
            height: 1.45,
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: Colors.black87,
          ),
    );
  }

  Widget imageWidget() {
    return Center(
      child: DecoratedBox(
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
          aspectRatio: 0.68,
          child: Image.network(
            widget.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget button() {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
          backgroundColor: Colors.black,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 14),
          iconColor: Colors.white,
          maximumSize: const Size.fromWidth(200)),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Start Reading',
            style: TextStyle(color: Colors.white, fontSize: 12),
          ),
          SizedBox(width: 5),
          Icon(
            CupertinoIcons.arrow_up_right,
            size: 18,
          )
        ],
      ),
    );
  }

  Widget desc() {
    return const BookInfo(
      title: "Description",
      description:
          '''The story takes place during Harry's first year at Hogwarts School, where he learns more about Voldemort's past and the prophecy that foretells his defeat.

With action-packed sequences, shocking twists and moments of heart-wrenching tragendy, "Harry Potter and the Philosopher's Stone" is a must-read for any fan of the Potter series.''',
    );
  }

  Widget authorSection() {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          foregroundImage: AssetImage('assets/images/portrait.jpg'),
        ),
        SizedBox(width: novPrimaryBodyMargin),
        Flexible(
          child: BookInfo(
            title: "JK Rowling",
            description:
                '''Joanne Rowling is an accomplished author renowned for her diverse portfolio, including the acclaimed debut "Book". 
\nJoanne's storytelling prowess shines through crafting compelling characters and intricate plots that have earned her a reputation as a versatile and influential voice in modern literature.
\nHer portfolio reflects a commitment to literary excellence and creative exploration, leaving an indelible mark on the literary landscape.''',
            style: TextStyle(
              height: 2,
              fontSize: 12,
              color: Colors.black54,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }

  Widget editors() {
    return const BookInfo(
      title: "Editors",
      description: '''JK Rowling(author), Christopher Reath, Alena Gestabon''',
    );
  }
}
