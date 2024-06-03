part of 'news_bloc.dart';

@immutable
sealed class NewsEvent extends Equatable {}

class NewsLoad extends NewsEvent {
  @override
  List<Object?> get props => [];
}

class NewsSearch extends NewsEvent {
  final String queryText;
  NewsSearch({required this.queryText});
  @override
  List<Object?> get props => [queryText];
}
