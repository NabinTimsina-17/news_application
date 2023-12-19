import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:news_application/category_card.dart';
import 'package:news_application/models/news_model.dart';
import 'package:news_application/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
   List<Articles>? articles;
  late HttpService httpService;
  void getUserData()async{
   Response res =await httpService.getRequest("");
   log(res.toString());
AllNews allNews = AllNews.fromJson(res.data) ;
log(allNews.toString());
articles =allNews.articles;
setState(() {
  
});
log(articles!.first.title!);
  }


  @override
  void initState() {
    httpService =HttpService();
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
              style:
                  TextStyle(color: Colors.black87, fontWeight: FontWeight.w600),
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
         CategoryCard(),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                
                
                return Container(
                  color: const Color.fromARGB(255, 195, 189, 189),
                  child: Column(
                    children: [
                      Image.network('articles![index].urlToImage'),
                      Text(articles![index].title!),
                      Text(articles![index].description!),
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