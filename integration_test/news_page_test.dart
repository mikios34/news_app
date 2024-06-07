// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_import, directives_ordering

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import './../test/step/the_app_is_running.dart';
import './../test/step/i_tap_the_menu_button_on_the_app_bar.dart';
import './../test/step/i_tap_text.dart';
import './../test/step/the_app_theme_changes_to_the_selected_theme.dart';
import './../test/step/i_launch_the_news_app.dart';
import './../test/step/circular_progress_indicator_is_displayed_initially.dart';
import './../test/step/i_wait_int_seconds.dart';
import './../test/step/the_news_app_displays_a_list_of_news_articles.dart';
import './../test/step/list_of_news_articles_is_displayed.dart';
import './../test/step/i_tap_the_share_button_on_a_specific_article_card.dart';
import './../test/step/the_app_should_provide_sharing_options.dart';
import './../test/step/i_tap_on_specific_article_card.dart';
import './../test/step/i_should_see_a_detailed_view_of_the_selected_article.dart';
import './../test/step/i_enter_text_into_search_field.dart';
import './../test/step/i_tap_icon.dart';
import './../test/step/i_wait.dart';
import './../test/step/i_should_see_the_article_with_the_text_text.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('''News Page''', () {
    testWidgets('''User toggles theme using app bar menu''', (tester) async {
      await theAppIsRunning(tester);
      await iTapTheMenuButtonOnTheAppBar(tester);
      await iTapText(tester, 'Dark');
      await theAppThemeChangesToTheSelectedTheme(tester);
      await iTapTheMenuButtonOnTheAppBar(tester);
      await iTapText(tester, 'Light');
      await theAppThemeChangesToTheSelectedTheme(tester);
      await iTapTheMenuButtonOnTheAppBar(tester);
      await iTapText(tester, 'System');
      await theAppThemeChangesToTheSelectedTheme(tester);
    });
    testWidgets('''User opens the app and news articles are fetched''',
        (tester) async {
      await iLaunchTheNewsApp(tester);
      await circularProgressIndicatorIsDisplayedInitially(tester);
      await iWaitIntSeconds(tester, 5);
      await theNewsAppDisplaysAListOfNewsArticles(tester);
    });
    testWidgets('''User share article''', (tester) async {
      await listOfNewsArticlesIsDisplayed(tester);
      await iTapTheShareButtonOnASpecificArticleCard(tester);
      await theAppShouldProvideSharingOptions(tester);
    });
    testWidgets('''User opens a news article''', (tester) async {
      await listOfNewsArticlesIsDisplayed(tester);
      await iTapOnSpecificArticleCard(tester);
      await iShouldSeeADetailedViewOfTheSelectedArticle(tester);
    });
    // testWidgets('''Search for news''', (tester) async {
    //   await theAppIsRunning(tester);
    //   await iEnterTextIntoSearchField(tester, 'biden');
    //   await iTapIcon(tester, Icons.search);
    //   await iWait(tester);
    //   await iShouldSeeTheArticleWithTheTextText(tester, "biden");
    // });
  });
}
