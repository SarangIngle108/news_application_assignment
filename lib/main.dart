import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application_assignment/dependency_injections.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';

import 'package:news_application_assignment/features/daily_news/presentation/bloc/article/remote/news_article_bloc.dart';
import 'package:news_application_assignment/features/daily_news/presentation/pages/home/daily_news.dart';

Future<void> main() async {
  await initialiseDependencied();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<NewsArticleBloc>(
      create: (context) => dependency()
        ..add(NewArticleEventFetchData(
            params: const ArticleParams(sources: 'techcrunch'))),
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData.dark(),
          home: const DailyNews(),
        ),
      ),
    );
  }
}
