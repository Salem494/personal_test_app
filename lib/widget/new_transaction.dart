import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
   NewTransaction( this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 8,
      color: Colors.grey[100],
      child: Column(
        children: [
          TextField(decoration: InputDecoration(labelText:'Title'),
           controller: titleController,

          ),
          TextField(decoration: InputDecoration(labelText:'Amount'),
             controller: amountController,
            keyboardType:TextInputType.number,
          ),
          FlatButton(
            child: Text('Add Transaction'),
            onPressed:() {
              widget.addTx(
                titleController.text,
                double.parse(amountController.text),
              );
            },
            textColor: Colors.blue,
          )
        ],
      ),
    );

  }
}
