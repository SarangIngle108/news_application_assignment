import 'package:dartz/dartz.dart';
import 'package:news_application_assignment/features/daily_news/data/data_sources/remote/news_api_service.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/aricle_entity.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';
import 'package:news_application_assignment/features/daily_news/domain/repository/article_repository.dart';

class ArticleRepositoryImplementation extends ArticleRepsitory {
  final ApiHandler apiHandler;
  ArticleRepositoryImplementation({required this.apiHandler});

  @override
  Future<Either<AppError, List<ArticleModel>>> getDailyNewsArticle(
      ArticleParams params) async {
    return await apiHandler.getNewsArticle(params);
  }
}
