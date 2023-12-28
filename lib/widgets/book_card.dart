import 'package:flutter/material.dart';

import '../models/book_model.dart';

class BookCard extends StatelessWidget {
  final Book book;
  const BookCard({Key? key, required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                ('${book.image}'),
                fit: BoxFit.fill,
                height: 150,
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  ListTile(
                    title: Text('${book.title}'),
                    trailing: Chip(
                      label: Text("${book.price} KWD"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () {}, icon: const Icon(Icons.edit)),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
