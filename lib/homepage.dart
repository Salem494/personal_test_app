import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personaltest/transaction.dart';
import 'package:personaltest/widget/new_transaction.dart';
import 'package:personaltest/widget/transaction_list.dart';
import 'package:personaltest/widget/charts.dart';


class HomePage extends StatefulWidget {
  
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Transaction> _userTransactions =[
//    Transaction(
//      id: 'c1',
//      title: 'New Car',
//      amount: 590.25,
//      date:DateTime.now(),
//    ),
//    Transaction(
//      id: 'c2',
//      title: 'New Shoes',
//      amount: 59.25,
//      date:DateTime.now(),
//    ),
  ];
 List<Transaction> get _recentTransactions {
   return _userTransactions.where((context){
     return context.date.isAfter(DateTime.now().subtract(
       Duration(days:7),
     ));
   }).toList();
 }
  // ignore: missing_return
  Void _addNewTransaction(String txTitle,double txAmount){
    final newTx  = Transaction(
        title: txTitle,
        amount: txAmount,
        date: DateTime.now(),
        id: DateTime.now().toString()
    );

    setState(() {
      _userTransactions.add(newTx);
    });
  }

  void _startAddNewTransaction(BuildContext context){
    showModalBottomSheet(context: context, builder: (_){
      return GestureDetector(
          onTap: (){},
          child: NewTransaction(_addNewTransaction),
          behavior: HitTestBehavior.opaque,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('PERSONAL TEST'),
        elevation: 8,
        actions: [
          IconButton(
            icon:Icon(Icons.add),
             onPressed: () => _startAddNewTransaction(context),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
               Chart(_recentTransactions),
            SizedBox(
              height: 5,
            ),
            TransactionList(_userTransactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddNewTransaction(context),
       elevation: 8,
       child: Icon(Icons.add),
      ),

    );
  }
}
