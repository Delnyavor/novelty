import 'package:flutter/material.dart';
import 'package:novelty/common/theming/constants.dart';
import 'package:novelty/common/widgets/title.dart';
import 'package:novelty/features/home/domain/entities/book.dart';
import 'package:novelty/features/home/presentation/widgets/components/popular_books_widget.dart';

class PopularBooksList extends StatelessWidget {
  final List<Book> bookList;
  const PopularBooksList({super.key, required this.bookList});

  @override
  Widget build(BuildContext context) {
    return buildContents(context);
  }

  Widget buildContents(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: novPrimaryBodyMargin,
            bottom: novTitleMargin,
            // right: novTitleMargin,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SectionTitle(
                text: 'Popular Books',
              ),
              TextButton(
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.resolveWith(
                    (states) => const Size(10, 20),
                  ),
                  padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.all(5)),
                ),
                onPressed: () {},
                child: const Icon(
                  Icons.arrow_forward_rounded,
                ),
              ),
            ],
          ),
        ),
        Container(
          // color: Colors.green[100],
          // padding: const EdgeInsets.symmetric(vertical: 10.0),
          // child: AspectRatio(aspectRatio: 1.4, child: list()),
          height: 300,
          child: list(),
        )
      ],
    );
  }

  Widget list() {
    return GridView(
      padding: const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
      scrollDirection: Axis.horizontal,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1,
        mainAxisSpacing: 30,
        childAspectRatio: 2.1,
      ),
      children: const [
        PopularBooksWidget(
            image:
                "https://images.ctfassets.net/usf1vwtuqyxm/2DCs73x6P8seNobQ9zBSbO/1a5dfd6ed5fc0ed9545370470fc3d74c/English_Harry_Potter_1_Epub_9781781100219.jpg",
            title: "Harry Potter And The Philosophers Stone"),
        PopularBooksWidget(
            image:
                "https://template.canva.com/EAD7WuSVrt0/1/0/1003w-LVthABb24ik.jpg",
            title: "The Hypocrite World"),
        PopularBooksWidget(
            image:
                "https://hips.hearstapps.com/digitalspyuk.cdnds.net/15/50/1449878132-9781781100264.jpg?resize=980:*",
            title: "Harry Potter And The Deathly Hallows"),
        PopularBooksWidget(
            image:
                "https://freight.cargo.site/t/original/i/b3052f7f5391d2a58a33c584c53bbf1895e58abe7f1f58a0c9c020924b8323e9/cover-web.jpg",
            title: "To kill A Mockingbird"),
        PopularBooksWidget(
            image:
                "https://m.media-amazon.com/images/I/716E6dQ4BXL._SY466_.jpg",
            title: "Sapiens, A Brief History Of Mankind"),
      ],
      // itemBuilder: (BuildContext context, int index) {
      //   return PopularBooksWidget(image: addresses[index]);
      // },
      // itemCount: 5,
    );
  }
  // Widget list() {
  //   List<String> addresses = [
  //     "https://m.media-amazon.com/images/I/716E6dQ4BXL._SY466_.jpg",
  //     "https://images.ctfassets.net/usf1vwtuqyxm/2DCs73x6P8seNobQ9zBSbO/1a5dfd6ed5fc0ed9545370470fc3d74c/English_Harry_Potter_1_Epub_9781781100219.jpg",
  //     "https://template.canva.com/EAD7WuSVrt0/1/0/1003w-LVthABb24ik.jpg",
  //     "https://hips.hearstapps.com/digitalspyuk.cdnds.net/15/50/1449878132-9781781100264.jpg?resize=980:*",
  //     "https://freight.cargo.site/t/original/i/b3052f7f5391d2a58a33c584c53bbf1895e58abe7f1f58a0c9c020924b8323e9/cover-web.jpg"
  //   ];
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: novPrimaryBodyMargin),
  //     child: Column(
  //       children: addresses.map((e) => PopularBooksWidget(image: e)).toList(),
  //     ),
  //   );
  // }
}
