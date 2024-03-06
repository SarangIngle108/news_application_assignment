import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application_assignment/config/theme/text_style.dart';
import 'package:news_application_assignment/features/daily_news/data/models/article.dart';

class NewsDetailPage extends StatelessWidget {
  final ArticleModel articleModel;
  NewsDetailPage({super.key, required this.articleModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.network(
            articleModel.urlToImage,
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            child: SafeArea(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    Column(
                      children: [
                        Text(
                          articleModel.description,
                          style: ThemeText.s29w800,
                        ),
                        SizedBox(
                          height: 64.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              articleModel.source.name,
                              style: ThemeText.s20w300,
                            ),
                            Text(articleModel.publishedAt)
                          ],
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          articleModel.content,
                          style: ThemeText.s12w800,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
