import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/services/api_services.dart';
import '../utils/category_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Articles>? articles;
  late HttpService httpService;

void getUserData() async {
  try {
    Response res = await httpService.getRequest("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e332b11c23d64f4d93d86aff90eb1442"); 
    log(res.toString()); 
    AllNews allNews = AllNews.fromJson(res.data);
    log(allNews.toString()); 
    articles = allNews.articles;
    log(articles.toString()); 
    setState(() {});
  } catch (e) {
    log("Error: $e");
  }
}


  @override
  void initState() {
    httpService = HttpService();
    getUserData();
    super.initState();
  }

@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Gandaki",
            style: TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
          ),
          Text(
            "News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
          )
        ],
      ),
      backgroundColor: Colors.transparent,
      elevation: 0.0,
    ),
    body: Column(
      children: [
        // Category List
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categoryList.length,
            itemBuilder: (context, index) {
              return Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Image.network(
                      categoryList[index]["url"]!,
                      height: 80,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                    Text(categoryList[index]["title"]!),
                  ],
                ),
              );
            },
          ),
        ),
        // Article List
        Expanded(
          child: articles == null || articles!.isEmpty
              ? Center(
                  child: Text(
                    'No articles available',
                    style: TextStyle(fontSize: 18),
                  ),
                )
              : ListView.builder(
                  itemCount: articles!.length,
                  itemBuilder: (BuildContext context, int index) {
                    String? imageUrl = articles?[index].urlToImage;
                    String? title = articles?[index].title;
                    String? description = articles?[index].description;

                    return Container(
                      margin: const EdgeInsets.all(10),
                      color: const Color.fromARGB(255, 195, 189, 189),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (imageUrl != null && imageUrl.isNotEmpty)
                            Image.network(
                              imageUrl,
                              width: double.infinity,
                              height: 200,
                              fit: BoxFit.cover,
                            ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (title != null && title.isNotEmpty)
                                  Text(
                                    title,
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                if (description != null && description.isNotEmpty)
                                  Text(
                                    description,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.black54,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    ),
  );
}

}
