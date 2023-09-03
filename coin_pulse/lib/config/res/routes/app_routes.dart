part of 'routes.dart';

class AppRoutes {
  static List<GetPage> routes() =>
      [GetPage(name: RoutePaths.homePage, page: () => const HomePage())];
}
