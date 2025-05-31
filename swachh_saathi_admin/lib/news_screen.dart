import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:swachh_saathi_admin/constants.dart';
import 'package:swachh_saathi_admin/models/article_model.dart';
import 'package:swachh_saathi_admin/news.dart'; // Assuming NewsArticle() screen is here

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Article> articleItems = [];
  @override
  void initState() {
    fetchRecords();
    super.initState();
  }

  fetchRecords() async {
    var records = await FirebaseFirestore.instance
        .collection('articles')
        .orderBy('createdAt', descending: true)
        .get();
    mapRecords(records);
  }

  mapRecords(QuerySnapshot<Map<String, dynamic>> records) {
    var _list = records.docs
        .map((article) => Article(
              id: article.id,
              title: article['title'],
              description: article['description'],
              // imageUrl: map['imageUrl'],
              userId: article['userId'],
              createdAt: article['createdAt'],
            ))
        .toList();

    setState(() {
      articleItems = _list;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'News and Articles',
              style: TextStyle(fontSize: 30.sp, fontWeight: FontWeight.w500),
            ),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: articleItems.length,
                itemBuilder: (context, index) {
                  // final article = articleItems[index];
                  return GestureDetector(
                    onTap: () {
                      Get.to(() => NewsArticle(article: articleItems[index]));
                    },
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
                      child: Container(
                        height: 120.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: backgroundColor,
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(10.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8.r),
                                child: Image.asset(
                                  'assets/img/clean2.png',
                                  width: 100.w,
                                  height: 100.h,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.image_not_supported),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.only(right: 10.w),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      articleItems[index].title,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18.sp,
                                        color: themeColor,
                                      ),
                                    ),
                                    Text(
                                      articleItems[index].createdAt,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 12.sp,
                                        color: Colors.red,
                                      ),
                                    ),
                                    SizedBox(height: 5.h),
                                    Text(
                                      articleItems[index].description,
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 13.sp,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          )),
    );
  }
}
