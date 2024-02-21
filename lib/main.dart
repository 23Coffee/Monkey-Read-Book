import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true, // Aligns the title in the middle
        
        title: const Text(
          "Recommendation Books",
          style: TextStyle(fontWeight: FontWeight.bold), // Makes the text bold
        ),
        leading: Image.network(
          "https://cdn.pixabay.com/photo/2015/07/23/13/08/gear-856921_960_720.png",
          width: 32, // Adjust the width as needed
          height: 32, // Adjust the height as needed
        ),
        
      ),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBoxUrl(
            book_name: "HARRY POTTER AND THE PHILOSOPHER'S STONE",
            author: "J. K. ROWLING",
            rating: "3.65/5",
            image: "https://api.chulabook.com/images/pid-109873.jpeg",
          ),
          ProductBoxUrl(
                book_name: "HARRY POTTER AND THE CHAMBER OF SECRETS",
                author: "J. K. ROWLING",
                rating: "4.4/5",
                image: "https://api.chulabook.com/images/pid-135307.jpeg"),
            ProductBoxUrl(
                book_name: "HARRY POTTER AND THE PRISONER OF AZKABAN",
                author: "J. K. ROWLING",
                rating: "3.8/5",
                image: "https://api.chulabook.com/images/pid-7308.jpg"),
            ProductBoxUrl(
                book_name: "HARRY POTTER AND THE ORDER OF THE PHOENIX",
                author: "J. K. ROWLING",
                rating: "4.5/5",

                image: "https://api.chulabook.com/images/pid-110189.jpg"),
            ProductBoxUrl(
                book_name: "HARRY POTTER AND THE HALF-BLOOD PRINCE",
                author: "J. K. ROWLING",
                rating: "3.2/5",
                image: "https://api.chulabook.com/images/pid-110190.jpg"),
            ProductBoxUrl(
                book_name: "HARRY POTTER AND THE GOBLET OF FIRE",
                author: "J. K. ROWLING",
                rating: "4.7/5",
                image: "https://api.chulabook.com/images/pid-137954.jpg"),
        ],
      ),
    );
  }
}




class ProductBoxUrl extends StatelessWidget {
  ProductBoxUrl({
    Key? key,
    required this.book_name,
    required this.author,
    required this.rating,
    required this.image,
  }) : super(key: key);

  final String book_name;
  final String author;
  final String rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 120,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.network(image),
            Expanded(
              child: Container(
                padding: EdgeInsets.all(5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      this.book_name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(this.author),
                    Text("rating: " + this.rating.toString()),
                  ],
                ),
              ),
            ),
          ],
        ),
        // Add background box with color code "D9D9D9"
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        color: Color(0xFFD9D9D9), // Color code "D9D9D9"
      ),
    );
  }
}

//-----------------------------------------------------------------
//Original

// class ProductBoxUrl extends StatelessWidget {
//   ProductBoxUrl(
//       {Key? key,
//       required this.book_name,
//       required this.author,
//       required this.rating,
//       required this.image})
//       : super(key: key);
//   final String book_name;
//   final String author;
//   final int rating;
//   final String image;
//   Widget build(BuildContext context) {
//     return Container(
//         padding: EdgeInsets.all(2),
//         height: 120,
//         child: Card(
//             child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//               Image.network(image),
//               Expanded(
//                   child: Container(
//                       padding: EdgeInsets.all(5),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           Text(this.book_name,
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                           Text(this.author),
//                           Text("rating: " + this.rating.toString()),
//                         ],
//                       )))
//             ])));
//   }
// }