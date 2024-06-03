import 'package:get_it/get_it.dart';
import 'package:news_app/data/news.dart';
import 'package:news_app/repository/news.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

setupInjector() {
  getIt.registerSingleton<NewsRepository>(
      NewsRepository(NewsDataProvider(httpClient: http.Client())));
}
