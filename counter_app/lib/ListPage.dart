import 'package:counter_app/ListMapProvider.dart';
import 'package:counter_app/counterProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('List Page'),
        centerTitle: true,
      ),
      body: Consumer<Listmapprovider>(
        builder: (ctx, Provider, __) {
          var allData = Provider.getData();
          return allData.isNotEmpty
              ? ListView.builder(
                itemCount: allData.length,
                itemBuilder: (_, index) {
                  return ListTile(
                    title: Text('${allData[index]['name']}'),
                    subtitle: Text('${allData[index]['mobile']}'),
                  );
                },
              )
              : Center(child: Text('No Data Found'));
        },
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple,
        onPressed: () {
          context.read<CounterProvider>().IncreamentCounter();
          context.read<Listmapprovider>().addData({
            'name': 'Ashmit',
            'mobile': 7217442932,
          });
        },
        child: Icon(Icons.add, color: Colors.black),
      ),
    );
  }
}
