import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Demo "),
      ),
      body: BlocBuilder<NewsBloc, NewsState>(
        builder: (context, state) {
          if (state is NewsLoadSuccess) {
            return ListView.builder(
              itemCount: state.articles.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(state.articles[index].title),
              ),
            );
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
