import 'package:flutter/material.dart';

void myFunction(String myString) {
  // Function body
}

class SummarySpend extends StatelessWidget {
  static String id = 'SummarySpend';
  String _selectedItem = 'Item 1'; // Define a variable to keep track of the selected item

  List<String> _items = ['Item 1', 'Item 2', 'Item 3']; // Define a list of items for the dropdown

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      child: Container(
        child: Column(
          children: [
            const Text(
              'Expense Tracker',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontFamily: 'Helvetica',
                decoration: TextDecoration.underline,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 100),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  prefixIcon: Icon(Icons.food_bank),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  prefixIcon: Icon(Icons.payment),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  prefixIcon: Icon(Icons.emoji_transportation),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const Expanded(
              child: TextField(
                decoration: InputDecoration(
                  enabled: false,
                  prefixIcon: Icon(Icons.sports_esports),
                  contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            DropdownButton<String>(
              value: _selectedItem, // Set the currently selected item
              items: _items.map((String item) {
                return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (String? selectedItem) {
                myFunction(selectedItem!); // Add null check operator
              },
            ),
          ],
        ),
      ),
    );
  }
}
