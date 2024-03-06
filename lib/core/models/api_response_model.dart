import 'dart:convert';

import 'package:news_application_assignment/core/models/api_response_error_model.dart';

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
        articles: json['articles'] as Map<String, dynamic>? ??
            json['error'] as Map<String, dynamic>? ??
            ApiResponseError(
              message: 'Something went wrong...',
            ).toJson(),
      );

  final Map<String, dynamic> articles;

  Map<String, dynamic> toJson() => {
        'articles': articles,
      };
}
