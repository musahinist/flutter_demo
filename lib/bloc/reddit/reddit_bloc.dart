import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/model/reddit.dart';
import '../../data/repository/reddit_repo.dart';
import '../../util/http/http_exception.dart';

part 'reddit_event.dart';
part 'reddit_state.dart';

class RedditBloc extends Bloc<RedditEvent, RedditState> {
  RedditBloc() : super(RedditInitial());

  RedditRepo redditRepo = RedditRepo();

  @override
  Stream<RedditState> mapEventToState(
    RedditEvent event,
  ) async* {
    if (event is RedditRequestEvent) {
      yield const RedditLoadingState();
      try {
        final List<Reddit> reddits = await redditRepo.getReddits();
        yield RedditLoadedState(reddits: reddits);
      } catch (e) {
        yield RedditErrorState(error: HttpException.handleError(e));
      }
    }
  }
}
