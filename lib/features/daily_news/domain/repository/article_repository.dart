import 'package:dartz/dartz.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/aricle_entity.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';

abstract class ArticleRepsitory {
  Future<Either<AppError, List<ArticleModel>>> getDailyNewsArticle(
      ArticleParams params);
}
