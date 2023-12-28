import 'package:api_books/provider/books_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  TextEditingController idController = TextEditingController();

  TextEditingController _titleController = TextEditingController();

  @override
  void dispose() {
    idController.dispose();
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a book"),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            Center(child: Text("Fill those field to add a book")),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: idController,
                decoration: InputDecoration(hintText: 'Add book ID'),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TextField(
                controller: _titleController,
                decoration: InputDecoration(hintText: 'Add book title'),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<BooksProvider>().createBooks(
                      int.parse(idController.text), _titleController.text);
                  GoRouter.of(context).pop();
                },
                child: const Text('add new note'))
          ],
        ),
      ),
    );
  }
}
