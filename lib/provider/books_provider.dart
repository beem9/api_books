import 'package:api_books/models/book_model.dart';
import 'package:api_books/services/book_services.dart';
import 'package:flutter/material.dart';

class BooksProvider extends ChangeNotifier {
  List<Book> books = [];

  Future<void> getBooks() async {
    books = await BookServices().getBooksApi();
    notifyListeners();
  }

  Future<void> createBooks(int id, String title) async {
    books = await BookServices().createBookApi(id, title);
    getBooks();
  }

  Future<void> editBooks(int id, int newID) async {
    books = await BookServices().editBookApi(id, newID);
    getBooks();
  }

  Future<void> deleteBooks(int id) async {
    books = await BookServices().deleteBookApi(id);
    getBooks();
  }
}
