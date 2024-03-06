part of 'news_article_bloc.dart';

abstract class NewsArticleState extends Equatable {
  const NewsArticleState();
}

final class NewsArticleInitial extends NewsArticleState {
  @override
  List<Object?> get props => [];
}

class NewsArticleLoadingState extends NewsArticleState {
  @override
  List<Object?> get props => [];
}

class NewsArticleDataFetchState extends NewsArticleState {
  final List<ArticleModel> articles;
  NewsArticleDataFetchState({required this.articles});

  @override
  List<Object?> get props => [articles];
}

class NewsArticleErrorState extends NewsArticleState {
  final String error;
  NewsArticleErrorState({required this.error});

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
