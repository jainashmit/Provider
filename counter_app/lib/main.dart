import 'package:counter_app/ListMapProvider.dart';
import 'package:counter_app/ListPage.dart';
import 'package:counter_app/counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => Listmapprovider()),
        ],
        child:  MyApp()
   )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(),
      
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Flutter Demo'),
      ),
      body: Center(
        child: Consumer(
          builder: (ctx, __, _) {
            return Text(
              '${ctx.watch<CounterProvider>().getCount()}',
              // '${Provider.of(ctx, listen: true).getCount()}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ListPage()),
          );
          // context.read<CounterProvider>().IncreamentCounter();
          // ============== OR ===================
          // Provider.of<CounterProvider>(
          //   context,
          //   listen: false,
          // ).IncreamentCounter;
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
