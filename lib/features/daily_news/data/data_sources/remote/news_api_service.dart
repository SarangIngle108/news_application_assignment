import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:news_application_assignment/core/constants/constants.dart';
import 'package:news_application_assignment/core/models/api_response_model.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/app_error.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';

class ApiHandler {
  ApiHandler();

  Future<Either<AppError, List<ArticleModel>>> getNewsArticle(
      ArticleParams params) async {
    try {
      final query = <dynamic>[];
      query.add('apiKey=${Constants.apiKey}');

      if (params.category != '') {
        query.add('category=${params.category}');
      }
      if (params.country != '') {
        query.add('country=${params.country}');
      }

      final response = await http.get(Uri.parse(
          '${Constants.newsApiBaseURL}/top-headlines?${query.join('&')}'));
      final body = apiResponseModelFromJson(response.body);
      if (response.statusCode == HttpStatus.accepted) {
        return Right(body.articles);
      } else {
        return left(AppError('Something went wrong'));
      }
    } catch (e) {
      return Left(AppError(e.toString()));
    }
  }
}
