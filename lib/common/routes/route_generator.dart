import 'package:flutter/material.dart';
import 'package:novelty/common/routes/routes.dart';
import 'package:novelty/common/transitions/route_transitions.dart';
import 'package:novelty/features/app/presentation/pages/app_page.dart';
import 'package:novelty/features/app/presentation/pages/samples.dart';
import 'package:novelty/features/book_details/presentation/pages/book_details_page.dart';
import 'package:novelty/features/home/presentation/pages/home_page.dart';
import 'package:novelty/main.dart';

Route<dynamic>? onGeneratePrimaryRoute(RouteSettings settings) {
  if (settings.name == AppRoutes.root) {
    return MaterialPageRoute(builder: (_) => const Landing());
  }

  if (settings.name!.startsWith(AppRoutes.app)) {
    final subroute = settings.name!.substring(AppRoutes.app.length);
    return MaterialPageRoute(
      builder: (_) => AppPage(
        appPageRoute: subroute,
      ),
    );
  }

  return MaterialPageRoute(builder: (_) => const Scaffold());
}

Route<dynamic>? globalSubRoutes(RouteSettings settings) {
  if (settings.name == AppRoutes.viewBookDetails) {
    final name = (settings.arguments! as Map<String, dynamic>)["name"];
    final image = (settings.arguments! as Map<String, dynamic>)["image"];
    return fadeInRoute(BookDetailsPage(image: image, name: name));
  }
  if (settings.name == AppRoutes.viewAuthor) {
    return fadeInRoute(const SampleB());
  }
  if (settings.name == AppRoutes.viewCategory) {
    return fadeInRoute(const SampleC());
  }
  if (settings.name == AppRoutes.viewUserProfile) {
    return fadeInRoute(const SampleD());
  }

  if (settings.name == AppRoutes.viewNotifications) {
    return fadeInRoute(const SampleD());
  }
  return null;
}

Route<dynamic>? onGenerateAppRoute(RouteSettings settings) {
  print(settings);

  if (settings.name == AppRoutes.homeRoutePrefix) {
    return fadeInRoute(const HomePage());
  }
  if (settings.name == AppRoutes.libraryRoutePrefix) {
    return fadeInRoute(const SampleB());
  }
  if (settings.name == AppRoutes.searchRoutePrefix) {
    return fadeInRoute(const SampleC());
  }
  if (settings.name == AppRoutes.communityRoutePrefix) {
    return fadeInRoute(const SampleD());
  }

  Route<dynamic>? route = globalSubRoutes(settings);
  if (route != null) return route;

  return MaterialPageRoute(builder: (_) => const Scaffold());
}

// Route<dynamic>? onGenerateHomeRoute(RouteSettings settings) {
//   if (settings.name == AppRoutes.viewBookDetails) {
//     return fadeInRoute(const BookDetailsPage());
//   }
//   if (settings.name == AppRoutes.viewAuthor) {
//     return fadeInRoute(const SampleB());
//   }
//   if (settings.name == AppRoutes.viewCategory) {
//     return fadeInRoute(const SampleC());
//   }
//   if (settings.name == AppRoutes.viewUserProfile) {
//     return fadeInRoute(const SampleD());
//   }

//   if (settings.name == AppRoutes.viewNotifications) {
//     return fadeInRoute(const SampleD());
//   }
//   return MaterialPageRoute(builder: (_) => const Scaffold());
// }
// // Route<dynamic>? onGenerateLibraryRoute(RouteSettings settings) {
// //   if (settings.name!.startsWith(AppRoutes.libraryRoutePrefix)) {
// //     final subroute =
// //         settings.name!.substring(AppRoutes.libraryRoutePrefix.length);
// //   }
// // }
