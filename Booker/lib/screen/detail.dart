import 'package:booker/screen/search.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  static const String id = 'detail_screen';
  final Book book;

  DetailScreen({required this.book});

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Book? _book;

  @override
  void initState() {
    super.initState();
    _book = widget.book;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            'Book Details',
            style: TextStyle(color: Colors.white),
          ),
        ),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              Center(
              child: _book?.imageUrl != null
                  ? Transform.scale(
                      scale: 1.0,// Reducing size by 50%
                      child: Image.network(
                        _book!.imageUrl!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Placeholder(),
            ),
              Text(
                'Title: ${_book?.title ?? 'Unknown'}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text('Author(s): ${_book?.author ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              SizedBox(height: 16.0),
              Text('Description: ${_book?.description ?? 'No description available'}'),
              SizedBox(height: 8.0),
              Text('Page Count: ${_book?.pageCount ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              Text('Categories: ${_book?.categories?.join(', ') ?? 'Unknown'}'),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  // Handle link click
                },
                child: Text('Preview Link: ${_book?.previewLink ?? 'No preview available'}'),
              ),
              SizedBox(height: 8.0),
              GestureDetector(
                onTap: () {
                  // Handle link click
                },
                child: Text('Info Link: ${_book?.infoLink ?? 'No info available'}'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
