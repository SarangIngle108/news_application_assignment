import 'package:get_it/get_it.dart';
import 'package:news_application_assignment/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_application_assignment/features/daily_news/data/repository/article_repository_implementation.dart';
import 'package:news_application_assignment/features/daily_news/domain/repository/article_repository.dart';
import 'package:news_application_assignment/features/daily_news/domain/use_cases/get_articles.dart';
import 'package:news_application_assignment/features/daily_news/presentation/bloc/article/remote/news_article_bloc.dart';

final dependency = GetIt.instance;

Future<void> initialiseDependencied() async {
  dependency.registerSingleton<ApiHandler>(ApiHandler());

//repositries
  dependency.registerSingleton<ArticleRepsitory>(
      ArticleRepositoryImplementation(apiHandler: dependency()));

//use case
  dependency.registerSingleton<GetArticle>(GetArticle());

  //bloc
  dependency.registerFactory<NewsArticleBloc>(
      () => NewsArticleBloc(getArticle: dependency()));
}
