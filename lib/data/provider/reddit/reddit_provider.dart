import 'package:dio/dio.dart';

import '../abstract_provider.dart';

class RedditProvider extends AbstractProvider {
  RedditProvider({
    this.path = 'TechNewsToday',
    this.tag = 'redditService',
  }) : super(path, tag);

  final String path;
  final String tag;

  Future<Response> getReddits() async {
    try {
      final Response response =
          await get(innerPath: 'top.json', queryParameters: {'count': '20'});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
