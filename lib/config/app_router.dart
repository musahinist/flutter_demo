import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import '../bloc/device_info/device_info_bloc.dart';
import '../bloc/reddit/reddit_bloc.dart';
import '../view/device_info/device_info_page.dart';
import '../view/flowing_text/flowing_text_page.dart';
import '../view/home/home_page.dart';
import '../view/redit_clone/reddit_page.dart';

class AppRouter {
  static final List<GetPage> route = <GetPage>[
    GetPage(
      name: HomePage.$PATH,
      page: () => const HomePage(),
    ),
    GetPage(
      name: DeviceInfoPage.$PATH,
      page: () => BlocProvider<DeviceInfoBloc>(
          create: (context) =>
              DeviceInfoBloc()..add(const DeviceInfoRequestEvent()),
          child: const DeviceInfoPage()),
    ),
    GetPage(
      name: FlowingTextPage.$PATH,
      page: () => const FlowingTextPage(),
    ),
    GetPage(
      name: RedditPage.$PATH,
      page: () => BlocProvider<RedditBloc>(
          create: (context) => RedditBloc()..add(const RedditRequestEvent()),
          child: const RedditPage()),
    ),
  ];
}
