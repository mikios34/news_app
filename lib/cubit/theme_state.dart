part of 'theme_cubit.dart';

// enum MyThemeMode { light, dark, system }

class ThemeState extends Equatable {
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);

  @override
  List<Object> get props => [themeMode];

  Future<void> saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
        'theme_mode', themeMode.name.toString()); // Save as a string
  }
  
}
