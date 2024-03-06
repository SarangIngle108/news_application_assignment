import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';
import 'package:news_application_assignment/features/daily_news/domain/use_cases/get_articles.dart';

part 'news_article_event.dart';
part 'news_article_state.dart';

class NewsArticleBloc extends Bloc<NewsArticleEvent, NewsArticleState> {
  final GetArticle getArticle;
  NewsArticleBloc({required this.getArticle}) : super(NewsArticleInitial()) {
    on<NewArticleEventFetchData>((event, emit) async {
      emit(NewsArticleLoadingState());
      final data = await getArticle.call(event.params);
      data.fold((l) => emit(NewsArticleErrorState(error: l.message)),
          (r) => emit(NewsArticleDataFetchState(articles: r)));
    });
  }
}
