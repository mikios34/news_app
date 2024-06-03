import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc({required this.newsRepository}) : super(NewsLoading()) {
    on<NewsLoad>(newsLoadHandler);
  }

  FutureOr<void> newsLoadHandler(
      NewsLoad event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepository.getNewsArticles();
      emit(NewsLoadedSuccess(articles: articles));
    } catch (_) {
      emit(NewsOperationFailure());
    }
  }
}
