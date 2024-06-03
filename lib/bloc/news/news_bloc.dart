import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:news_app/injector.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/repository/news.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  late final NewsRepository newsRepository;
  NewsBloc() : super(NewsLoading()) {
    newsRepository = getIt.get<NewsRepository>();
    on<NewsLoad>(newsLoadHandler);
    on<NewsSearch>(newsSearchHandler);
  }

  FutureOr<void> newsLoadHandler(
      NewsLoad event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles = await newsRepository.getNewsArticles();
      emit(NewsLoadSuccess(articles: articles));
    } catch (_) {
      emit(NewsOperationFailure());
    }
  }

  FutureOr<void> newsSearchHandler(
      NewsSearch event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    try {
      final articles =
          await newsRepository.searchNewsArticles(queryText: event.queryText);
      emit(NewsLoadSuccess(articles: articles));
    } catch (_) {
      emit(NewsOperationFailure());
    }
  }
}
