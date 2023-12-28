// import 'package:api_books/provider/books_provider.dart';
// import 'package:api_books/views/home_page.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:provider/provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//       create: (context) => BooksProvider(), child: MyApp()));
// }

// class MyApp extends StatelessWidget {
//   MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       routerConfig: _router,
//       // routeInformationParser: _router.routeInformationParser,
//       // routerDelegate: _router.routerDelegate,
//       debugShowCheckedModeBanner: false,
//     );
//   }

//   final GoRouter _router = GoRouter(
//     routes: [
//       GoRoute(
//         path: '/',
//         builder: (context, state) => HomePage(),
//       ),
//       GoRoute(
//         path: '/add',
//         builder: (context, state) => HomePage(),
//       ),
//     ],
//   );
// }

import 'package:api_books/provider/books_provider.dart';
import 'package:api_books/views/add_page.dart';
import 'package:api_books/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BooksProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

  final _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => HomePage(),
      ),
      GoRoute(
        path: '/add',
        builder: (context, state) => AddPage(),
      ),
    ],
  );
}
