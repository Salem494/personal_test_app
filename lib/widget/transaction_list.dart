import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:personaltest/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction>transaction;

  const TransactionList(this.transaction);

  @override
  Widget build(BuildContext context) {

   return Container(
     height: 300,
     child: ListView.builder(
       itemBuilder: (context, index){
         return Card(
           elevation: 8,
           color: Colors.grey[200],
           child: Row(
             children: [
               Container(
                 child: Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Text('\$${transaction[index].amount}'),
                 ),
                 margin: EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                 decoration: BoxDecoration(
                     border: Border.all(color: Colors.blue,width: 2)

                 ),
               ),
               SizedBox(width: 10,),
               Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text(transaction[index].title,style: TextStyle(
                     fontWeight: FontWeight.bold,
                     fontSize: 16,

                   ),),
                   Text(
                     DateFormat('yyyy-MM-dd').format(transaction[index].date)
                     ,style: TextStyle(
                       fontWeight: FontWeight.w300
                   ),),
                 ],
               )
             ],
           ),
         );
       },
       itemCount: transaction.length,
     ),
   );

  }
}

