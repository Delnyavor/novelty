import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:novelty/common/routes/navigator_keys.dart';
import 'package:novelty/common/routes/route_generator.dart';
import 'package:novelty/common/routes/routes.dart';

class AppPage extends StatefulWidget {
  final String appPageRoute;
  const AppPage({super.key, required this.appPageRoute});

  @override
  createState() => _AppPage();
}

class _AppPage extends State<AppPage> {
  int currentPageIndex = 0;

  final List<String> routesMappings = [
    AppRoutes.homeRoutePrefix,
    AppRoutes.libraryRoutePrefix,
    AppRoutes.searchRoutePrefix,
    AppRoutes.communityRoutePrefix,
    AppRoutes.viewBookDetails,
  ];

  bool shouldPop = false;
  late Timer timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void activateTimer() {
    timer = Timer(const Duration(seconds: 2), () {
      setState(() {
        shouldPop = false;
      });
    });
  }

  void returnToIndexPage() {
    primaryNavigatorKey.currentState!
        .pushNamedAndRemoveUntil(routesMappings.first, (route) {
      return route.settings.name == AppRoutes.app;
    });

    setState(() {
      currentPageIndex = 0;
    });
  }

  Future<bool> _isExitDesired() async {
    if (currentPageIndex > 0) {
      returnToIndexPage();
      return false;
    } else if (!shouldPop) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Press back once again to exit.')));
      setState(() {
        shouldPop = true;
      });
      if (context.mounted) {
        activateTimer();
      }
      return false;
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      timer.cancel();
      return true;
    }
  }

  void exit() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) return;

        if (await _isExitDesired() && context.mounted) {
          exit();
        }
      },
      child: DecoratedBox(
        decoration: const BoxDecoration(color: Colors.white),
        child: Scaffold(
          backgroundColor:
              Theme.of(context).colorScheme.surfaceTint.withOpacity(0.095),
          body: body(),
          bottomNavigationBar: navbar(),
          extendBody: true,
        ),
      ),
    );
  }

  Widget navbar() {
    return NavigationBar(
      labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      selectedIndex: currentPageIndex,
      indicatorShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      indicatorColor: Theme.of(context).colorScheme.inversePrimary,
      onDestinationSelected: (int index) {
        if (currentPageIndex != index) {
          setState(() {
            currentPageIndex = index;
          });
          primaryNavigatorKey.currentState!.pushNamed(routesMappings[index]);
        }
      },
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.roofing_rounded, color: Colors.white),
          icon: Icon(Icons.roofing_rounded),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_rounded),
          selectedIcon: Icon(Icons.menu_book_rounded, color: Colors.white),
          label: 'Library',
        ),
        NavigationDestination(
          icon: Icon(CupertinoIcons.search),
          selectedIcon: Icon(CupertinoIcons.search, color: Colors.white),
          label: 'Search',
        ),
        NavigationDestination(
          icon: Icon(CupertinoIcons.chat_bubble_2_fill),
          selectedIcon: Icon(CupertinoIcons.chat_bubble_2, color: Colors.white),
          label: 'Community',
        ),
      ],
    );
  }

  Widget body() {
    return Navigator(
      key: primaryNavigatorKey,
      initialRoute: widget.appPageRoute,
      onGenerateRoute: onGenerateAppRoute,
    );
  }
}
