import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/news/news_bloc.dart';
import 'package:news_app/cubit/theme_cubit.dart';
import 'package:news_app/injector.dart';
import 'package:news_app/screen/home_page.dart';
import 'package:news_app/theme.dart';

void main() async {
  setupInjector();
  WidgetsFlutterBinding.ensureInitialized();
  final initialTheme = await ThemeCubit.getInitialThemeMode();

  runApp(MyApp(
    themeMode: initialTheme,
  ));
}

class MyApp extends StatelessWidget {
  final ThemeMode themeMode;
  const MyApp({required this.themeMode, super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeCubit(themeMode),
          ),
          BlocProvider(
            create: (context) => NewsBloc()..add(NewsLoad()),
          ),
        ],
        child: BlocBuilder<ThemeCubit, ThemeState>(
          builder: (context, state) {
            return MaterialApp(
              title: 'Flutter Demo',
              themeMode: state.themeMode,
              darkTheme: darkTheme,
              theme: lightTheme,
              home: HomePage(),
            );
          },
        ));
  }
}
