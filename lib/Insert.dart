import 'package:flutter/material.dart';

class Insert extends StatelessWidget {
  static String id = 'Insert';
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(80),
      ),
      child: Container(

        child: Column(
          children: [
            Text('Expense Tracker',style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Helvetica',
              decoration: TextDecoration.underline,
              color: Colors.black87,
            ),),
            SizedBox(height: 100),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.food_bank),
                  contentPadding: EdgeInsets.symmetric(vertical: 1.0, horizontal: 8.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter the spend on Food',
                ),
              ),
            ),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.payment),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter the spend on Utility',
                ),
              ),
            ),

            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.emoji_transportation),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter the spend on Transportation',
                ),
              ),
            ),
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.sports_esports),
                  contentPadding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  border: OutlineInputBorder(),
                  hintText: 'Enter the spend on Entertainment',
                ),
              ),
            ),
            Expanded(

              child: Container(

                child: TextButton(

                  onPressed: () {
                    // Callback function for when the button is pressed
                    print('Button pressed');
                  },
                  child: Text('Submit'),
                ),
              ),
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
            )
          ],

        ),

      )


    );

  }
}
