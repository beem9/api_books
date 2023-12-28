import 'package:api_books/provider/books_provider.dart';
import 'package:api_books/widgets/book_card.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Book Store"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  GoRouter.of(context).push('/add');
                },
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Add a new Book"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text("Get all books"),
                ),
              ),
            ),
            FutureBuilder(
              future: context.read<BooksProvider>().getBooks(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return Consumer<BooksProvider>(
                  builder: (context, booksProvider, child) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: booksProvider.books.length,
                      itemBuilder: (context, index) =>
                          BookCard(book: booksProvider.books[index])),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
