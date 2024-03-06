import 'package:equatable/equatable.dart';

class ArticleParams extends Equatable {
  // final String country;
  // final String category;
  final String sources;
  const ArticleParams({
    required this.sources,
  });

  @override
  List<Object?> get props => [sources];
}
