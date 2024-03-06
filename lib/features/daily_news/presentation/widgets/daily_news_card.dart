import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_application_assignment/config/theme/text_style.dart';

class DailyNewsCard extends StatelessWidget {
  final String imageUrl;
  final String headline;
  final String name;
  final String date;
  const DailyNewsCard(
      {super.key,
      required this.imageUrl,
      required this.headline,
      required this.date,
      required this.name});

  @override
  Widget build(BuildContext context) {
    print('priting url :$imageUrl');
    return imageUrl.isEmpty
        ? Container(
            height: 250.h,
            color: Colors.red,
            child: Center(
                child: Text(
              headline,
              style: ThemeText.s29w800,
            )),
          )
        : Padding(
            padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),

            // height: 180,

            child: Card(
              elevation: 24,
              child: Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.network(
                      '$imageUrl', // Replace with your actual image URL
                      width: double.infinity,
                      height: 250.h,
                      fit: BoxFit.cover,
                      // You can replace this with your own placeholder or loading indicator
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return Center(
                          child: CircularProgressIndicator(
                            value: loadingProgress.expectedTotalBytes != null
                                ? loadingProgress.cumulativeBytesLoaded /
                                    (loadingProgress.expectedTotalBytes ?? 1)
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                  // Text above the image
                  Container(
                    height: 250.h,
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            headline,
                            style: ThemeText.s20w300,
                            maxLines: 3,
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Row(
                            children: [
                              Text(
                                name,
                                style: ThemeText.s12w800,
                              ),
                              SizedBox(width: 20.w),
                              Text(
                                date,
                                style: ThemeText.s12w800,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    //color: Colors.red,
                  )
                ],
              ),
            ),
          );
  }
}
