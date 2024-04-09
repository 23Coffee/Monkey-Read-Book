import 'package:flutter/foundation.dart';

class LikedBooks extends ChangeNotifier {
  Set<String> _likedBookIds = {};

  Set<String> get likedBookIds => _likedBookIds;

  void toggleLiked(String bookId) {
    if (_likedBookIds.contains(bookId)) {
      _likedBookIds.remove(bookId);
    } else {
      _likedBookIds.add(bookId);
    }
    notifyListeners();
  }

  bool isBookLiked(String bookId) {
    return _likedBookIds.contains(bookId);
  }
}
