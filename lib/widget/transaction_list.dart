import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:u_dumy_self_expenses_app/component/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> updateTransaction;
  final Function deleteTx;

  TransactionList(this.updateTransaction, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return updateTransaction.isEmpty
        ? Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              const Text(
                'NOT ADD SOMETHING YET',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 30),
              ),
              const SizedBox(
                height: 40,
              ),
              Image.asset('assets/images/Background.jpg'),
            ],
          )
        : SizedBox(
            height: 500,
            child: ListView.builder(
              itemCount: updateTransaction.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 10,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Padding(
                          padding: const EdgeInsets.all(6),
                          child: Text(
                            '\$${updateTransaction[index].amount}',
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      updateTransaction[index].title,
                      style: const TextStyle(
                          fontFamily: 'Baskervville',
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(updateTransaction[index].date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(updateTransaction[index].id),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
