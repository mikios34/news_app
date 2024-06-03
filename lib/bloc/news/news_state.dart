// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'news_bloc.dart';

@immutable
sealed class NewsState extends Equatable {}



class NewsLoading extends NewsState {
  @override
  List<Object?> get props => [];
}

class NewsLoadedSuccess extends NewsState {
  final List<Article> articles;
  NewsLoadedSuccess({
    required this.articles,
  });
  @override
  List<Object?> get props => [articles];
}

class NewsOperationFailure extends NewsState {
  @override
  List<Object?> get props => [];
}
