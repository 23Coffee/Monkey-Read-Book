import 'dart:convert';
import 'package:booker/screen/Category.dart';
import 'package:booker/screen/detail.dart';
import 'package:booker/screen/recommend.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_tts/flutter_tts.dart';

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

  Future<void> speakText(String text) async {
    FlutterTts flutterTts = FlutterTts();
    await flutterTts.setLanguage('en-US');
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(text);
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
        title: Text(
          'Book Search',
          style: TextStyle(color: Colors.white),
          overflow: TextOverflow.ellipsis,
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
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 8)), // Adjust padding as needed
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, RecommendPage.id);
            },
            child: Text(
              'Recommend',
              style: TextStyle(color: Colors.white),
            ),
            style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                    horizontal: 8)), // Adjust padding as needed
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
                      style: TextStyle(),
                      controller: _searchController,
                      decoration: InputDecoration(
                        labelText: 'Search for Books',
                        labelStyle: TextStyle(
                          color: Colors
                              .black, // Sets label text color to black (when not focused)
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Colors.black), // Default border color
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width:
                                  1.0), // Border color when the TextFormField is enabled
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                          borderSide: BorderSide(
                              color: Colors.black,
                              width:
                                  2.0), // Border color when the TextFormField is focused
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
                            crossAxisCount: 2,
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
                                    builder: (context) =>
                                        DetailScreen(book: book),
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
                                          IconButton(
                                            icon: Icon(
                                              book.liked
                                                  ? Icons.favorite
                                                  : Icons.favorite_border,
                                              color: book.liked
                                                  ? Colors.red
                                                  : null,
                                            ),
                                            onPressed: () async {
                                              // Toggle liked status and store the result
                                              bool willBeLiked = !book.liked;

                                              // Update UI to reflect changes
                                              setState(() {
                                                book.toggleLiked();
                                              });

                                              // Only speak if the book is now liked
                                              if (willBeLiked) {
                                                await speakText(
                                                    '${book.title} by ${book.author}');
                                              }
                                            },
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
  bool liked;

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
    this.liked = false, // Initialize liked status as false
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
  void toggleLiked() {
    liked = !liked; // Toggle liked status
  }
}
