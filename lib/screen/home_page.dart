import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screen/widgets/article_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Demo "),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              switch (value) {
                case 0:
                  context.read<ThemeCubit>().toggleTheme(ThemeMode.dark);
                  break;
                case 1:
                  context.read<ThemeCubit>().toggleTheme(ThemeMode.light);
                  break;
                case 2:
                  context.read<ThemeCubit>().toggleTheme(ThemeMode.system);
                  break;
              }
            },
            itemBuilder: (context) => const [
              PopupMenuItem(value: 0, child: Text("Dark")),
              PopupMenuItem(value: 1, child: Text("Light")),
              PopupMenuItem(value: 2, child: Text("System"))
            ],
          ),
        ],
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadSuccess) {
            return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) =>
                    ArticleCard(article: state.articles[index]));
          }
          if (state is NewsOperationFailure) {
            return const Center(
              child: Text("News Load Operation Failure."),
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
