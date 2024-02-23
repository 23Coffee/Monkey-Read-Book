import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:booker/screen/ebook.dart'; // Import the EbookScreen page

class ListPage extends StatefulWidget {
  static const String id = 'list_page';

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          "Recommendation Books",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error initializing Firebase: ${snapshot.error}'));
          }
          return StreamBuilder(
            stream: FirebaseFirestore.instance.collection('Recommendation').snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (snapshot.hasError) {
                return Center(child: Text('Error fetching data from Firestore: ${snapshot.error}'));
              }
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  var document = snapshot.data!.docs[index];
                  return MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () {
                        if (document['book_name'] == "HARRY POTTER AND THE PHILOSOPHER'S STONE") {
                          Navigator.pushNamed(context, EbookScreen.id);
                        }
                      },
                      child: ProductBoxUrl(
                        book_name: document['book_name'],
                        author: document['author'],
                        rating: document['rating'],
                        image: document['image'],
                      ),
                    ),
                  );
                },
              );
            },
          );
        },
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
                    Text("Rating: " + this.rating),
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
