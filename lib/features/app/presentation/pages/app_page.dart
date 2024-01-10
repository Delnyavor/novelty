import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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

  final _navigatorKey = GlobalKey<NavigatorState>();

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
    _navigatorKey.currentState!.pushNamed(routesMappings.first);
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
      child: Scaffold(
        body: body(),
        bottomNavigationBar: navbar(),
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
        setState(() {
          currentPageIndex = index;
        });
        _navigatorKey.currentState!.pushNamed(routesMappings[index]);
      },
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.roofing_rounded),
          icon: Icon(Icons.home_filled),
          label: 'Home',
        ),
        NavigationDestination(
          icon: Icon(Icons.menu_book_rounded),
          label: 'Library',
        ),
        NavigationDestination(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        NavigationDestination(
          selectedIcon: Icon(CupertinoIcons.chat_bubble_2_fill),
          icon: Icon(CupertinoIcons.chat_bubble_2),
          label: 'Community',
        ),
      ],
    );
  }

  Widget body() {
    return Navigator(
      key: _navigatorKey,
      initialRoute: widget.appPageRoute,
      onGenerateRoute: onGenerateAppRoute,
    );
  }
}
