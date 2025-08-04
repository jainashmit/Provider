import 'package:expense_tracker_app/Provider/transactionProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String title = '';
  dynamic amnt = 0;
  TextEditingController titlecontroller = TextEditingController();
  TextEditingController amountController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        title: Text(
          'Expense Tracker',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50, bottom: 40, left: 12, right: 12),
            child: Card(
              
              color: Colors.white,
              elevation: 8,
              shadowColor: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Monthly Summary',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    SizedBox(height: 24),
                    Consumer(
                      builder: (ctx, _, __) {
                        return Row(
                          children: [
                             Text(
                                'Total Income : ${ctx.watch<TransactionProvider>().getTotalIncome()}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              Expanded(child: SizedBox()),
                           Text(
                                'Total Expense : ${ctx.watch<TransactionProvider>().getTotalExpense()}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 24),
                    Consumer(
                      builder: (ctx, _, __) {
                        return Text(
                          'Remaining Balance : ${ctx.watch<TransactionProvider>().getremainingBal()} ',
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),

          Expanded(
            child: Consumer<TransactionProvider>(
              builder: (c, Provider, __) {
                var allData = Provider.getallData();
                return allData.isNotEmpty
                    ? ListView.builder(
                      itemBuilder: (c, index) {
                        var allData =
                            c.watch<TransactionProvider>().getallData();
                        return Padding(
                          padding: EdgeInsets.all(12),
                          child: ListTile(
                          
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)
                            ),
                            title: Text(
                              '${allData[index]['title']}',
                              style: TextStyle(color: Colors.black , fontSize: 16),
                            ),
                            subtitle: Text(
                              '${allData[index]['type']}',
                              style: TextStyle(color: Colors.black , fontSize: 12),
                            ),
                            tileColor: allData[index]['type'] == 'Income'
                                        ? Colors.green
                                        : Colors.red,
                            trailing: Text(
                              '${allData[index]['Amount']}',
                              style: TextStyle(
                                fontSize: 16,
                                color:Colors.black
                                    // allData[index]['type'] == 'Income'
                                    //     ? Colors.green
                                    //     : Colors.red,
                              ),
                            ),
                          ),
                        );
                      },
                      itemCount: allData.length,
                    )
                    : Center(child: Text('No Data Found'));
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () {
          showModalBottomSheet(
            isScrollControlled: false,
            context: context,
            backgroundColor: Colors.white,
            builder: (context) {
              return Padding(
                padding: EdgeInsets.all(12),
                child: Column(
                  children: [
                    TextField(
                      controller: titlecontroller,
                      onChanged: (value) {
                        title = value;
                      },
                      decoration: InputDecoration(hintText: 'Title'),
                    ),
                    SizedBox(height: 12),
                    TextField(
                      keyboardType: TextInputType.number,
                      controller: amountController,
                      onChanged: (value) {
                        amnt = value;
                      },
                      decoration: InputDecoration(hintText: 'Amount'),
                    ),
                    SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                              final title = titlecontroller.text.trim();
                              final amt =
                                  int.tryParse(amountController.text.trim()) ??
                                  0;
                              if (title.isNotEmpty && amt > 0) {
                                context.read<TransactionProvider>().addIncome(
                                  title,
                                  amt,
                                );
                                Navigator.pop(context);
                                titlecontroller.clear();
                              amountController.clear();
                              }                              
                            },
                            child: Text(
                              'Add as Income',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        SizedBox(width: 6),
                        Expanded(
                          child: TextButton(
                            onPressed: () {
                               final title = titlecontroller.text.trim();
                              final amt =
                                  int.tryParse(amountController.text.trim()) ??
                                  0;
                              if (title.isNotEmpty && amt > 0) {
                                context.read<TransactionProvider>().addExpense(
                                  title,
                                  amt,
                                );
                                Navigator.pop(context);
                                titlecontroller.clear();
                              amountController.clear();
                              }
                            },
                            child: Text(
                              'Add as Expense',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
