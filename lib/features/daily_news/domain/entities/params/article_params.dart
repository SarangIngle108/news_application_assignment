import 'package:equatable/equatable.dart';

class ArticleParams extends Equatable {
  final String country;
  final String category;
  const ArticleParams({required this.country, required this.category});

  @override
  List<Object?> get props => [country, category];
}
