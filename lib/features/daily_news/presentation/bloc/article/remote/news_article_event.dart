part of 'news_article_bloc.dart';

abstract class NewsArticleEvent extends Equatable {
  const NewsArticleEvent();
}

class NewArticleEventFetchData extends NewsArticleEvent {
  final ArticleParams params;
  NewArticleEventFetchData({required this.params});

  @override
  List<Object?> get props => [params];
}
