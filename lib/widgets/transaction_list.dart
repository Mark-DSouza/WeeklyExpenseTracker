import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 450,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (contxt, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                          child: Text(
                            '\$${transactions[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTransaction(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
//   child: Row(
//     children: [
//       Container(
//         padding: EdgeInsets.all(10),
//         margin: EdgeInsets.symmetric(
//           vertical: 10,
//           horizontal: 15,
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             color: Theme.of(context).primaryColor,
//             width: 2,
//           ),
//         ),
//         child: Text(
//           '\$${transactions[index].amount.toStringAsFixed(2)}',
//           style: TextStyle(
//             color: Theme.of(context).primaryColor,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//       ),
//       Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             transactions[index].title,
//             style: Theme.of(context).textTheme.headline6,
//           ),
//           Text(
//             DateFormat.yMMMd().format(transactions[index].date),
//             style: TextStyle(
//               color: Colors.grey,
//             ),
//           ),
//         ],
//       ),
//     ],
//   ),
// )
