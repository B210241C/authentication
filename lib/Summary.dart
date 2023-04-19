import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  @override
  SummarySpend createState() => SummarySpend();
}

class SummarySpend extends State<MyPage> {
  static String id = 'SummarySpend';
  String selectedPeriod = 'Daily'; // Default selected period is 'Daily'
  double summary = 50.0; // Pre-filled data for Summary (as a percentage)
  String food = 'Food Data'; // Pre-filled data for Food
  String utility = 'Utility Data'; // Pre-filled data for Utility
  String entertainment = 'Entertainment Data'; // Pre-filled data for Entertainment
  String transportation = 'Transportation Data'; // Pre-filled data for Transportation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expense Tracker'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            CircularProgressIndicator(
              value: summary / 100.0,
              backgroundColor: Colors.grey,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
              strokeWidth: 15.0,
              semanticsLabel: '$summary%',

            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Food',
                prefixIcon: Icon(Icons.food_bank),
              ),
              controller: TextEditingController(text: food),
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Utility',
                prefixIcon: Icon(Icons.payment),
              ),
              controller: TextEditingController(text: utility),
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Transportation',
                prefixIcon: Icon(Icons.emoji_transportation),
              ),
              controller: TextEditingController(text: transportation),
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Entertainment',
                prefixIcon: Icon(Icons.sports_esports),
              ),
              controller: TextEditingController(text: entertainment),
            ),



            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic here for displaying date picker
                _showDatePicker(context);
              },
              child: Text('Choose Date'),

            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add your logic here for saving data to the database
              },
              child: Text('Save'),
            ),

          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      // Add your logic here for handling the picked date and fetching data from the database
    }
  }
}
