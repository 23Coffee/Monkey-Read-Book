import 'package:flutter/cupertino.dart';
import 'package:firebase_storage/firebase_storage.dart';

class FireStoreDataBase {
  // Define a getter method to access the download URL
  String? _downloadURL;

  // Getter method to access the download URL
  String? get downloadURL => _downloadURL;

  // Method to fetch data
  Future<String?> getData() async {
    try {
      // Call the method to fetch download URL
      await downloadURLExample();
      // Return the download URL
      return _downloadURL;
    } catch (e) {
      // Print and handle errors
      debugPrint("Error - $e");
      return null;
    }
  }

  // Method to fetch download URL from Firebase Storage
  Future<void> downloadURLExample() async {
    // Get download URL for a specific file (e.g., user-login.png)
    _downloadURL = await FirebaseStorage.instance
        .ref()
        .child("user-login.png")
        .getDownloadURL();
    // Print the download URL for debugging
    debugPrint(_downloadURL.toString());
  }
}
