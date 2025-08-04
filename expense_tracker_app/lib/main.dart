import 'package:expense_tracker_app/Provider/transactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_app/View/Home.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TransactionProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'Urbanist',        
      ),
      home: HomePage(),
    );
  }
}

