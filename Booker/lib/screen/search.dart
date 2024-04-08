import 'dart:convert';
import 'package:booker/screen/Category.dart';
import 'package:booker/screen/detail.dart';
import 'package:booker/screen/recommend.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BookSearchPage extends StatefulWidget {
  static const String id = 'book_search_page';

  @override
  _BookSearchPageState createState() => _BookSearchPageState();
}

class _BookSearchPageState extends State<BookSearchPage> {
  late TextEditingController _searchController;
  List<Book> _books = [];
  bool _loading = false;
  
  

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _setDefaultSearchQuery(); // Set default search query
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    String? category = ModalRoute.of(context)!.settings.arguments as String?;
    if (category != null) {
      _searchBooks(category); // Use the category as the search query
    }
  }

  void _setDefaultSearchQuery() {
    // Set your default search query here
    String defaultQuery = 'Flutter';
    _searchBooks(defaultQuery);
  }
  Future<void> _searchBooks(String query) async {
    setState(() {
      _loading = true;
      _books.clear();
    });

    try {
    final response = await http.get(
      Uri.parse('https://www.googleapis.com/books/v1/volumes?q=$query'),
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> items = data['items'] ?? [];

      setState(() {
        _books = items.map((item) => Book.fromJson(item)).toList();
        _loading = false;
      });
    } else {
      throw Exception('Failed to load books');
    }
  } catch (error) {
    print('Error: $error');
    setState(() {
      _loading = false;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Text(
            'Book Search',
            style: TextStyle(color: Colors.white),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, CategoryScreen.id);
            },
            child: Text(
              'Category',
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RecommendPage.id);
            },
            child: Text(
              'Recommendation',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search for Books',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8.0),
                  ElevatedButton(
                    onPressed: () {
                      String searchText = _searchController.text;
                      // Trigger search with entered query
                      _searchBooks(searchText);
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                    child: Text(
                      'Search',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: _loading
                  ? Center(child: CircularProgressIndicator())
                  : _books.isNotEmpty
                      ? GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 8.0,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.6,
                          ),
                          itemCount: _books.length,
                          itemBuilder: (context, index) {
                            final book = _books[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => DetailScreen(book: book),
                                  ),
                                );
                              },
                              child: Card(
                                elevation: 2.0,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8.0),
                                            topRight: Radius.circular(8.0),
                                          ),
                                          image: book.imageUrl != null
                                              ? DecorationImage(
                                                  image: NetworkImage(
                                                      book.imageUrl!),
                                                  fit: BoxFit.cover,
                                                )
                                              : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            book.title,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          Text(
                                            'by ${book.author}',
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14.0,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        )
                      : Center(
                          child: Text('No books found'),
                        ),
            ),
          ],
        ),
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String? imageUrl;
  final String? ebookUrl;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final String? previewLink;
  final String? infoLink;

  Book({
    required this.title,
    required this.author,
    this.imageUrl,
    this.ebookUrl,
    this.description,
    this.pageCount,
    this.categories,
    this.previewLink,
    this.infoLink,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    String? imageUrl;
    if (json['volumeInfo']['imageLinks'] != null) {
      imageUrl = json['volumeInfo']['imageLinks']['thumbnail'];
    }

    return Book(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'] != null
          ? json['volumeInfo']['authors'].join(', ')
          : 'Unknown Author',
      imageUrl: imageUrl,
      ebookUrl: json['accessInfo']['epub'] != null
          ? json['accessInfo']['epub']['acsTokenLink']
          : null,
      description: json['volumeInfo']['description'],
      pageCount: json['volumeInfo']['pageCount'],
      categories: json['volumeInfo']['categories'] != null
          ? List<String>.from(json['volumeInfo']['categories'])
          : null,
      previewLink: json['volumeInfo']['previewLink'],
      infoLink: json['volumeInfo']['infoLink'],
    );
  }
}

