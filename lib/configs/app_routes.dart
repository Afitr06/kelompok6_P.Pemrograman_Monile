import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';
import 'package:pertemuan_v/modules/home_screen/home_screen.dart';
import 'package:pertemuan_v/modules/news_detail_screen/news_detail_screen.dart';
import 'package:pertemuan_v/modules/profile_detail/profile_detail.dart';
import 'package:pertemuan_v/modules/splash_screen/splash_screen.dart';

import '../models/news.dart';
import '../models/user.dart';

// ilyass

class AppRoutes {
  static const String splash = "splash";
  static const String home = "home";
  static const String newsDetail = "news-detail";
  static const String profileDetail = "profile-detail";

  static Page _splahScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: SplashScreen(),
    );
  }

  static Page _profileScreenBuilder(BuildContext context, GoRouterState state) {
    late User user;
    if (state.extra != null && state.extra is User) {
      user = state.extra as User;
    } else {
      user = User.dummy();
    }

    return MaterialPage(
      child: ProfileDetail(user: user),
    );
  }

  static Page _homeScreenBuilder(BuildContext context, GoRouterState state) {
    return const MaterialPage(
      child: HomeScreen(),
    );
  }

  static Page _newsDetailScreenBuilder(
    BuildContext context,
    GoRouterState state,
  ) {
    return MaterialPage(
      child: NewsDetailScreen(
        id: state.params["id"]!,
        news: state.extra as News,
      ),
    );
  }

  static final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        name: splash,
        path: "/splash",
        pageBuilder: _splahScreenBuilder,
      ),
      GoRoute(
        name: home,
        path: "/home",
        pageBuilder: _homeScreenBuilder,
        routes: [
          GoRoute(
            name: newsDetail,
            path: "news-detail:id",
            pageBuilder: _newsDetailScreenBuilder,
          ),
          GoRoute(
            name: profileDetail,
            path: "profile-detail",
            pageBuilder: _profileScreenBuilder,
          ),
        ],
      ),
    ],
    initialLocation: "/splash",
  );
}
