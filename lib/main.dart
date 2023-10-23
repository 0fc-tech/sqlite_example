import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_example/product.dart';

import 'category.dart';
import 'database_products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Database?>(
        future: DatabaseHelper.database,
        builder: (context, snapshot) {
          snapshot.data?.insert("Categories", Category(id: 3,name:  "Fruits").toMap());
          snapshot.data?.insert("Products", Product(id: 3,name:  "iPhone4",description: "Phone",category_id: 1).toMap());
          snapshot.data?.rawQuery('''
            SELECT Products.id, Products.name, Products.description, Products.category_id, Categories.name AS CategName
            FROM Products
            JOIN Categories ON Products.category_id = Categories.id
          ''').then((value) => print(value));
          return Text(snapshot.data?.path ?? "");
        }
      ),
    );
  }
}
