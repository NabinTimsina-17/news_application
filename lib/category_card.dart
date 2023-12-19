import 'package:flutter/material.dart';

import 'utils/category_list.dart';

class CategoryCard extends StatelessWidget {
   const CategoryCard({super.key});



  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          decoration:   BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(categoryList.first["url"]!)),
          ),
          child: const Center(
            child:  Text(
              "Business", 
             style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 247, 245, 245))
            ),
          ),
        ),

      Container(
          height: 100,
          width: 100,
          decoration:  const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://th.bing.com/th/id/OIP.RQ0PFt2uOPOhrtgdqqLrGQHaE4?rs=1&pid=ImgDetMain')),
          ),
          child: const Center(
            child:  Text(
              "Entertainment", 
             style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 251, 250, 250))
            ),
          ),
        ),

        Container(
          height: 100,
          width: 100,
          decoration:  const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('https://th.bing.com/th/id/R.a4a13ac34cc055c2fc04555cbcd9fbe4?rik=IO9DsBVNMo9jTw&pid=ImgRaw&r=0')),
          ),
          child: const Center(
            child:  Text(
              "General", 
             style: TextStyle(fontWeight: FontWeight.bold, color: Color.fromARGB(221, 244, 244, 244))
            ),
          ),
        ),
      ],
    );
  }
}