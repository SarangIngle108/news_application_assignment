import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_application_assignment/config/theme/colors.dart';
import 'package:news_application_assignment/config/theme/text_style.dart';
import 'package:news_application_assignment/features/daily_news/domain/entities/params/article_params.dart';
import 'package:news_application_assignment/features/daily_news/presentation/bloc/article/remote/news_article_bloc.dart';
import 'package:news_application_assignment/features/daily_news/presentation/pages/home/news_detail_page.dart';
import 'package:news_application_assignment/features/daily_news/presentation/widgets/daily_news_card.dart';

class DailyNews extends StatefulWidget {
  const DailyNews({super.key});

  @override
  State<DailyNews> createState() => _DailyNewsState();
}

class _DailyNewsState extends State<DailyNews> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor(HexColors.bodyBackgroundColor),
      appBar: AppBar(
        backgroundColor: HexColor(HexColors.appBarColor),
        title: Text(
          'headlines'.toUpperCase(),
          style: ThemeText.s29w800,
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<NewsArticleBloc, NewsArticleState>(
        builder: (context, state) {
          if (state is NewsArticleDataFetchState) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NewsDetailPage(
                              articleModel: state.articles[index])));
                    },
                    child: DailyNewsCard(
                      imageUrl: state.articles[index].urlToImage,
                      headline: state.articles[index].description,
                      name: state.articles[index].source.name,
                      date: state.articles[index].publishedAt,
                    ),
                  );
                });
          } else if (state is NewsArticleLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: IconButton(
                  onPressed: () {
                    BlocProvider.of<NewsArticleBloc>(context).add(
                        NewArticleEventFetchData(
                            params:
                                const ArticleParams(sources: 'techcrunch')));
                  },
                  icon: const Icon(Icons.refresh)),
            );
          }
        },
      ),
    );
  }
}
