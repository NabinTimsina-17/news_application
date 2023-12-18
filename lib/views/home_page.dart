import 'package:flutter/material.dart';
import 'package:news_application/category_card.dart';
import 'package:news_application/services/api_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HttpService httpService;
  void getUserData(){
    httpService.getRequest("");
  }
  @override
  void initState() {
    httpService =HttpService();
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
          const CategoryCard(),
          Expanded(
            
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 100,
              itemBuilder: (BuildContext context, int index) {
                
                return ListTile(
                  
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
