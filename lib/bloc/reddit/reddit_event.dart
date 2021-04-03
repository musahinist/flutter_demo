part of 'reddit_bloc.dart';

abstract class RedditEvent extends Equatable {
  const RedditEvent();

  @override
  List<Object> get props => [];
}

class RedditRequestEvent extends RedditEvent {
  const RedditRequestEvent();
  @override
  // TODO: implement props
  List<Object> get props => [];
}
