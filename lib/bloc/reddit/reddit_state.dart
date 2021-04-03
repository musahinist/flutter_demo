part of 'reddit_bloc.dart';

abstract class RedditState extends Equatable {
  const RedditState();

  @override
  List<Object> get props => [];
}

class RedditInitial extends RedditState {}

class RedditLoadingState extends RedditState {
  const RedditLoadingState();

  @override
  List<Object> get props => [];
}

class RedditLoadedState extends RedditState {
  const RedditLoadedState({required this.reddits});
  final List<Reddit> reddits;

  @override
  List<Object> get props => [reddits];
}

class RedditErrorState extends RedditState {
  const RedditErrorState({required this.error});
  final String error;
  @override
  List<Object> get props => [];
}
