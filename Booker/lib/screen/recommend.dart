import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  static const String id = 'list_page'; // Define the id property

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Recommendation Books",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
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
          // Add other ProductBoxUrl widgets
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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(10),
        elevation: 5,
        shadowColor: Colors.grey.withOpacity(0.5),
        color: Color(0xFFD9D9D9),
      ),
    );
  }
}
