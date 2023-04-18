import 'package:flutter/material.dart';

class InsertPage extends StatefulWidget {
  @override
  Insert createState() => Insert();
}

class Insert extends State<InsertPage> {
  static String id = 'Insert';
  String food = '';
  String utility = '';
  String transportation = '';
  String entertainment = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Expenses'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  food = value;
                });
              },
              decoration: InputDecoration(
                  labelText: 'Food',
                  prefixIcon: Icon(Icons.food_bank),
      ),

            ),
            TextField(

              onChanged: (value) {
                setState(() {
                  utility = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Utility',
                prefixIcon: Icon(Icons.payment),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  transportation = value;
                });
              },
              decoration: InputDecoration(
                labelText: 'Transportation',
                prefixIcon: Icon(Icons.emoji_transportation),
              ),
            ),
            TextField(
              onChanged: (value) {
                setState(() {
                  entertainment = value;
                });
              },
              decoration: InputDecoration(
                  labelText: 'Entertainment',
                  prefixIcon: Icon(Icons.sports_esports),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform validation or save data to a database
                print('Food: $food');
                print('Utility: $utility');
                print('Transportation: $transportation');
                print('Entertainment: $entertainment');
              },
              child: Text('Submit'),
            ),
            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  IconButton(
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pushNamed(context,'SummarySpend');
                    },
                    icon: const Icon(Icons.arrow_forward),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
