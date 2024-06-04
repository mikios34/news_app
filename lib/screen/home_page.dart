import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/screen/widgets/article_card.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final _serachTextFieldController = TextEditingController();

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
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextFormField(
              key: const Key("searchField"),
              controller: _serachTextFieldController,
              decoration: InputDecoration(
                  suffix: IconButton(
                      onPressed: () {
                        context.read<NewsBloc>().add(NewsSearch(
                            queryText: _serachTextFieldController.text));
                      },
                      icon: const Icon(Icons.search)),
                  contentPadding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 16),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(width: 0.2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(width: 0.2)),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(width: 0.2)),
                  hintText: "Search news...",
                  hintStyle: const TextStyle(fontWeight: FontWeight.w300)),
            ),
          ),
        ),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadSuccess) {
            return ListView.builder(
                itemCount: state.articles.length,
                itemBuilder: (context, index) =>
                    ArticleCard(
                      key: Key("articleCard$index"),
                      article: state.articles[index]));
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
