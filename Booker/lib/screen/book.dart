import 'dart:convert';
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
    _searchBooks('Flutter'); // Default search query
  }

  Future<void> _searchBooks(String query) async {
    setState(() {
      _loading = true;
      _books.clear();
    });

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
              Navigator.pushNamed(context, ListPage.id);
            },
            child: Text(
              'Recommendation',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
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
                    if (_searchController.text.isNotEmpty) {
                      _searchBooks(_searchController.text);
                    }
                  },
                  child: Text('Search'),
                ),
              ],
            ),
          ),
          Expanded(
            child: _loading
                ? Center(child: CircularProgressIndicator())
                : _books.isNotEmpty
                    ? ListView.builder(
                        itemCount: _books.length,
                        itemBuilder: (context, index) {
                          final book = _books[index];
                          return ListTile(
                            leading: book.imageUrl != null
                                ? Image.network(book.imageUrl!)
                                : SizedBox.shrink(), // Display image if available
                            title: Text(book.title),
                            subtitle: Text(book.author),
                          );
                        },
                      )
                    : Center(
                        child: Text('No books found'),
                      ),
          ),
        ],
      ),
    );
  }
}

class Book {
  final String title;
  final String author;
  final String? imageUrl; // Make imageUrl nullable

  Book({
    required this.title,
    required this.author,
    this.imageUrl,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    // Extract image link from imageLinks property if available
    String? imageUrl = json['volumeInfo']['imageLinks'] != null
        ? json['volumeInfo']['imageLinks']['thumbnail']
        : null;

    return Book(
      title: json['volumeInfo']['title'],
      author: json['volumeInfo']['authors'] != null
          ? json['volumeInfo']['authors'].join(', ')
          : 'Unknown Author',
      imageUrl: imageUrl,
    );
  }
}
