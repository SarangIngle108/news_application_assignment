import 'package:dartz/dartz.dart';
import 'package:news_application_assignment/core/use_cases/use_case.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';

class GetArticle implements UseCase<List<ArticleModel>, ArticleParams> {
  @override
  Future<Either<AppError, List<ArticleModel>>> call(ArticleParams params) {
    throw UnimplementedError();
  }
}
