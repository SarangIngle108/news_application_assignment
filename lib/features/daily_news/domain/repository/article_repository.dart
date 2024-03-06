import 'package:dartz/dartz.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/aricle_entity.dart';

abstract class ArticleRepsitory {
  Future<Either<AppError, List<ArticleEntity>>> getDailyNewsArticle();
}
