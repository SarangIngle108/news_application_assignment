// ignore_for_file: public_member_api_docs

class ApiResponseError {
  ApiResponseError({
    required this.message,
  });

  factory ApiResponseError.fromJson(Map<String, dynamic> json) =>
      ApiResponseError(
        message: json['message'],
      );
  final String message;

  ApiResponseError copyWith({
    String? message,
    String? code,
    String? stack,
  }) =>
      ApiResponseError(
        message: message ?? this.message,
      );

  Map<String, dynamic> toJson() => {
        'message': message,
      };
}
