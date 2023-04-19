import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class InsertPage extends StatefulWidget {
  @override
  Insert createState() => Insert();
}

class Insert extends State<InsertPage> {
  static String id = 'Insert';
  // Variables for food, utility, transportation, and entertainment
  String food = '';
  String utility = '';
  String transportation = '';
  String entertainment = '';

  // Variable for selected date
  DateTime selectedDate = DateTime.now();

  // Function to show date picker dialog
  Future<void> _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Insert Page'),
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
                _showDatePicker(context);
              },
              child: Text('Select Date'),
            ),
            SizedBox(height: 16.0),
            Text(
              'Selected Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Perform insertion logic with the variables and selected date
                print('Food: $food');
                print('Utility: $utility');
                print('Transportation: $transportation');
                print('Entertainment: $entertainment');
                print('Selected Date: $selectedDate');
              },
              child: Text('Insert Data'),
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
