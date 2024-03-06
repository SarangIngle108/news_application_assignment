import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_application_assignment/core/constants/constants.dart';

import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';

class ApiHandler {
  ApiHandler();

  Future<Either<AppError, List<ArticleModel>>> getNewsArticle(
      ArticleParams params) async {
    var client = http.Client();
    List<ArticleModel> articles = [];
    try {
      final query = <dynamic>[];
      query.add('apiKey=${Constants.apiKey}');

      if (params.sources != '') {
        query.add('sources=${params.sources}');
      }

      final response = await client.get(Uri.parse(
          '${Constants.newsApiBaseURL}/top-headlines?${query.join('&')}'));
      var body = jsonDecode(response.body);

      if (response.statusCode == 200) {
        for (int i = 0; i < body['articles'].length; ++i) {
          ArticleModel article = ArticleModel.fromJson(body['articles'][i]);
          articles.add(article);
        }

        return Right(articles);
      } else {
        return left(const AppError('Something went wrong'));
      }
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
