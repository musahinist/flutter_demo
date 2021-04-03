import '../model/reddit.dart';

import '../provider/reddit/reddit_provider.dart';

class RedditRepo {
  RedditProvider redditProvider = RedditProvider();

  Future<List<Reddit>> getReddits() async {
    try {
      final response = await redditProvider.getReddits();
      final List<Reddit> reddits = response.data['data']['children']
          .map<Reddit>((reddit) => Reddit.fromMap(reddit['data']))
          .toList();
      return reddits;
    } catch (e) {
      rethrow;
    }
  }
}
