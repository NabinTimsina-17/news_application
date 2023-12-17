import 'package:flutter/material.dart';
import 'package:news_application/category_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                
                return Container(
                  color: Colors.amber,
                  child: const Column(
                    children: [
                   
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
