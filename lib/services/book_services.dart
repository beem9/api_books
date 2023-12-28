import 'package:api_books/models/book_model.dart';
import 'package:dio/dio.dart';

class BookServices {
  final Dio _dio = Dio();
  final _baseUrl = 'https://coded-books-api-crud.eapi.joincoded.com/books';

  Future<List<Book>> getBooksApi() async {
    try {
      final Response response = await _dio.get(_baseUrl);

      final List<Book> listofBooks =
          List.from(response.data).map((e) => Book.fromJson(e)).toList();

      return listofBooks;
    } catch (e) {
      throw e.toString();
    }
  }

  createBookApi(int id, String title) async {
    try {
      final response = await _dio.post(
        _baseUrl,
        data: {
          "id": id,
          "title": title,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  editBookApi(int id, int newID) async {
    try {
      final response = await _dio.put(
        "$_baseUrl/$id",
        data: {
          "id": newID,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  deleteBookApi(int id) async {
    try {
      final response = await _dio.delete("$_baseUrl/$id");
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
