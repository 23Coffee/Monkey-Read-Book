import 'package:booker/screen/recommend.dart';
import 'package:booker/screen/search.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  static const String id = 'category_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/books (1).png',
                height: 40,
                width: 40,
              ),
              const SizedBox(width: 10),
              const Text(
                'Categories',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.0),
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.playlist_add,
              'My Lists',
            ),
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.book,
              'Novel',
            ),
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.fingerprint,
              'Crime Story',
            ),
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.local_library,
              'Harry Potter Series',
            ),
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.history,
              'Historical',
            ),
            SizedBox(height: 20),
            _buildCategoryItem(
              context,
              Icons.book_online,
              'Fantasy Novel',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(
    BuildContext context,
    IconData iconData,
    String title,
  ) {
    return InkWell(
      onTap: () {
        // Navigate to the search page with the selected category title as the search query
        Navigator.pushNamed(context, BookSearchPage.id, arguments: title);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(
              iconData,
              size: 40,
              color: Colors.black,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
