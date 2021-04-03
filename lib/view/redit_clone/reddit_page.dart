import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/reddit/reddit_bloc.dart';
import '../../data/model/reddit.dart';

class RedditPage extends StatelessWidget {
  const RedditPage({Key? key}) : super(key: key);
  static const String $PATH = '/reddit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reddit Clone'),
      ),
      body: BlocBuilder<RedditBloc, RedditState>(
        builder: (context, state) {
          if (state is RedditLoadedState) {
            return ListView.builder(
              itemCount: state.reddits.length,
              itemBuilder: (context, index) {
                final Reddit reddit = state.reddits[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(reddit.title),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(reddit.thumbnail),
                    ),
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
