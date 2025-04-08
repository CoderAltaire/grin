import 'package:flutter/cupertino.dart';
import 'package:grin/core/extension/log.dart';
import 'package:grin/core/routes/app_routes.dart';
import 'package:grin/view/drawer/view/my_results_screen.dart';
import 'package:grin/view/main/home/view/home_screen.dart';
import 'package:grin/view/main/main_screen.dart';
import 'package:grin/view/no_internet/no_inernet_screen.dart';
import 'package:grin/view/login/view/login_screen.dart';
import 'package:grin/view/login/view/select_lg_screen.dart';

Future<String?> path(String? path) async {
  "PATH: $path".printf(name: "MessagingService");
}

class RouteGenerate {
  static String? _routeName = '/';

  static String? get routeName => _routeName;

  static void setRoute() => _routeName = '/';

  Route? generate(RouteSettings settings) {
    debugPrint('Navigating to: ${settings.name}');

    _routeName = settings.name;
    path(_routeName);
    debugPrint('Navigating to: ${settings.name}');
    final args = settings.arguments;

    switch (settings.name) {
      case AppRoutes.noInternet:
        return simpleRoute(const NoInternetScreen());

      case AppRoutes.login:
        return simpleRoute(const LoginScreen());
      case AppRoutes.selectLanguage:
        return simpleRoute(const SelectLgScreen());
      case AppRoutes.homeScreen:
        return simpleRoute(const HomeScreen());
      case AppRoutes.mainScreen:
        return simpleRoute(const MainScreen());
      case AppRoutes.myResults:
        return simpleRoute(const MyResultsScreen());

      // case AppRoutes.splashScreen:
      // return simpleRoute(const SplashScreen());

      // case AppRoutes.myAddresses:
      //   return MaterialPageRoute(
      //       builder: (context) => const MyAddresses(),
      //       settings: RouteSettings(arguments: args));

      // case AppRoutes.notifications:
      //   return MaterialPageRoute(
      //       builder: (context) => const NotificationsScreen(),
      //       settings: RouteSettings(arguments: args));

      // case AppRoutes.savedCategories:
      //   return simpleRoute(const SavedCompaniesScreen());

      // case AppRoutes.ratePlacesScreen:
      //   return MaterialPageRoute(
      //       builder: (context) => const RatePlacesPage(),
      //       settings: RouteSettings(arguments: args));

      // case AppRoutes.commentWithCommentsList:
      //   return MaterialPageRoute(
      //       builder: (context) {
      //         return CommentsListPage(
      //           rating: (args as Map<String, dynamic>)['rating'],
      //           countComment: args['count_comment'],
      //           id: args['id'],
      //           title: args['title'],
      //           isAll: args['is_all'],
      //         );
      //       },
      //       settings: RouteSettings(arguments: args));
    }
    return null;
  }

  simpleRoute(Widget route) => CupertinoPageRoute(builder: (context) => route);
}
