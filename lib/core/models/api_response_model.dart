import 'dart:convert';

import 'package:news_application_assignment/core/models/api_response_error_model.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';

/// Convert JSON object to APIResposeModel object
ApiResponseModel apiResponseModelFromJson(String str) =>
    ApiResponseModel.fromJson(json.decode(str) as Map<String, dynamic>);

/// Convert APIResposeModel object to JSON object
String apiResponseModelToJson(ApiResponseModel data) =>
    json.encode(data.toJson());

/// API Response model
class ApiResponseModel {
  ApiResponseModel({
    required this.articles,
  });

  factory ApiResponseModel.fromJson(Map<String, dynamic> json) =>
      ApiResponseModel(
          articles: json['articles'] == null ? [] : json['articles']
          // json['error'] as Map<String, dynamic>? ??
          // ApiResponseError(
          //   message: 'Something went wrong...',
          // ).toJson(),
          );

  final List<ArticleModel> articles;

  Map<String, dynamic> toJson() => {
        'articles': articles,
      };
}
