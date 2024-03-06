import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';
import 'package:news_application_assignment/features/daily_news/presentation/bloc/article/remote/news_article_bloc.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    super.initState();

    BlocProvider.of<NewsArticleBloc>(context).add(NewArticleEventFetchData(
        params: ArticleParams(country: 'us', category: 'business')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
