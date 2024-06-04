// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

@immutable
sealed class NewsState extends Equatable {}

class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadSuccess extends NewsState {
  final List<Article> articles;
  final bool isSearch;
  NewsLoadSuccess({required this.articles, required this.isSearch});
  @override
  List<Object?> get props => [articles, isSearch];
}

class NewsOperationFailure extends NewsState {
  @override
  List<Object?> get props => [];
}
