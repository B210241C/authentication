import 'package:flutter/material.dart';

class LatestExpense extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          backgroundColor: Colors.blueGrey[800],
          child: const Icon(Icons.local_dining_outlined),
        ),
        title: const Text(
          'KFC',
          style: TextStyle(
              fontStyle: FontStyle.italic,
              fontSize: 20
          ),
        ),
        subtitle: Row(
          children: const [
            Text(
              'Category: Food',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'May 7, 2023 10:30 AM',
              style: TextStyle(
                fontSize: 10,
              ),
            ),
          ],
        ),
        trailing: Text(
          '- RM 250',
          style: TextStyle(
            fontSize: 20,
            fontStyle: FontStyle.italic,
            color: '- RM 250'.startsWith('-') ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
