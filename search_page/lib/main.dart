// THIS IS JUST A DRAFT; NO COMMENT: NO REFACTORING

import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: SearchPage(),
  ));
}

class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Container(
          decoration: BoxDecoration(
            color: Color.fromRGBO(217, 217, 217, 100),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {
                  // Handle search action
                },
              ),
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Your Book',
                    border: InputBorder.none,
                  ),
                  onSubmitted: (String value) {
                    // Handle search action
                  },
                ),
              ),
              IconButton(
                icon: Icon(Icons.mic),
                onPressed: () {
                  // Handle voice search action
                },
              ),
            ],
          ),
        ),
      ),
      
      body: Container( // search result list
        
        decoration: BoxDecoration(
          color: Color.fromRGBO(217, 217, 217, 100),
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Book(
                name: "HARRY POTTER AND THE PHILOSOPHER'S STONE",
                author: "JK Rowling",
                category: "Fantasy Novel",
                image:
                    "https://m.media-amazon.com/images/I/91r0dvXhNGL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "HARRY POTTER AND THE CHAMBER OF SECRETS",
                author: "JK Rowling",
                category: "Fantasy Novel",
                image:
                    "https://m.media-amazon.com/images/I/A15suNB9arL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "Selling Hitler",
                author: "Robert Harris",
                category: "History",
                image:
                    "https://m.media-amazon.com/images/I/81HSjoaF9oL._AC_UF1000,1000_QL80_.jpg"),
            Book(
                name: "กาลครั้งหนึ่งในความฝัน",
                author: "อัญชัน",
                category: "Novel",
                image: "https://api.chulabook.com/images/pid-194265.jpg"),
          ],
        ),
      ),
    );
  }
}


class Book extends StatelessWidget { // search result class
  Book(
      {Key? key,
      required this.name,
      required this.author,
      required this.category,
      required this.image})
      : super(key: key);
  final String name;
  final String author;
  final String category;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(6),
      height: 150,

      child: Card(
        
        child: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color.fromRGBO(130, 130, 130, 100),
                ),
          child: Row(

            children: <Widget>[
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color.fromARGB(255, 229, 225, 168),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    image,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text("Name: ",
                            style: TextStyle(
                                fontWeight:
                                    FontWeight.bold)), 
                        Text(this.name),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Author: ",
                            style: TextStyle(
                                fontWeight:
                                    FontWeight.bold)), 
                        Text(this.author), 
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text("Book category: ",
                            style: TextStyle(
                                fontWeight: FontWeight
                                    .bold)), 
                        Text(this.category), 
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


