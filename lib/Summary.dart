//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';



class MyPage extends StatefulWidget {
  @override
  SummarySpend createState() => SummarySpend();
}



class SummarySpend extends State<MyPage> {
  CollectionReference usersRef = FirebaseFirestore.instance.collection('categories');
  DocumentReference docRef = FirebaseFirestore.instance
      .collection('categories')
      .doc('Kdkv6798qnRIezQA5u7f');

int choosedatenumber = 0;

  late DateTime? pickedDate;
  late DateTime selectedDate = DateTime.now();
  String entertainmentcostString = '';
  static String id = 'SummarySpend';

  double foodcost = 0.0;
  double utilitycost = 0.0;
  double transportcost = 0.0;
  double entertainmentcost = 0.0;

  double foodcostTotal = 0.0;
  double utilitycostTotal = 0.0;
  double transportcostTotal = 0.0;
  double entertainmentcostTotal = 0.0;


  String selectedPeriod = 'Daily'; // Default selected period is 'Daily'
  double summary = 50.0; // Pre-filled data for Summary (as a percentage)
  String food = 'Food Data'; // Pre-filled data for Food
  String utility = 'Utility Data'; // Pre-filled data for Utility
  String entertainment = 'Entertainment Data'; // Pre-filled data for Entertainment
  String transportation = 'Transportation Data'; // Pre-filled data for Transportation
  // late final messageWidget;
  // List<Text> messagesWidget = [];

  TextEditingController foodController = TextEditingController();
  TextEditingController utilityController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController entertainmentController = TextEditingController();

  // Add your logic here for handling the picked date and fetching data from the database


  //
  // @override
  // void initState() {
  //   super.initState();
  //   selectedDate = DateTime.now();
  // }

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
              controller: foodController,
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Utility',
                prefixIcon: Icon(Icons.payment),
              ),
              controller: utilityController,
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Transportation',
                prefixIcon: Icon(Icons.emoji_transportation),
              ),
              controller: transportationController,
            ),
            TextField(
              enabled: false, // Set the text field to be disabled
              decoration: InputDecoration(
                labelText: 'Entertainment',
                prefixIcon: Icon(Icons.sports_esports),
              ),
              controller: entertainmentController,
            ),



            SizedBox(height: 16.0),
            Text('Selected Date: ${selectedDate.toString()}'),
            ElevatedButton(
              onPressed: () {
                // Add your logic here for displaying date picker
                _showDatePicker(context);

                // foodcostTotal = 0;
                // utilitycostTotal = 0;
                // transportcostTotal = 0;
                // entertainmentcostTotal = 0;




              },
              child: Text('Choose Date'),

            ),
            SizedBox(height: 16.0),
            ElevatedButton(

              onPressed: () async {

                if (pickedDate != null  && pickedDate!= selectedDate) {


                  // Convert the picked date into a Timestamp object
                  final pickedTimestamp = Timestamp.fromDate(pickedDate!);

                  // Query the categories collection for documents with a timestamp
                  // greater than or equal to the start of the picked date and less
                  // than the start of the next day
                  QuerySnapshot snapshot = await usersRef.where('timestamp', isGreaterThanOrEqualTo: pickedTimestamp, isLessThan: Timestamp.fromDate(pickedDate!.add(Duration(days: 1)))).get();


                  // Update the state of the app to display the appropriate values
                  if (snapshot.docs.isNotEmpty) {

                    setState(() {

                      selectedDate = pickedDate ?? selectedDate;

                      // Initialize the values of all categories to zero
                      foodcostTotal = 0.0;
                      utilitycostTotal = 0.0;
                      transportcostTotal = 0.0;
                      entertainmentcostTotal = 0.0;




                      // for (final document in snapshot.docs) {
                      //   // Get the data from the document
                      //   //final data = document.data();
                      //
                      //   final Map<String, dynamic> data = document.data() as Map<String, dynamic>;
                      //
                      //   // Add the cost of each category to their respective totals
                      //   foodcostTotal += int.parse((data['foodcost'] ?? '0').toString());
                      //   utilitycostTotal += int.parse((data['utilitycost'] ?? '0').toString());
                      //   transportcostTotal += int.parse((data['transportcost'] ?? '0').toString());
                      //   entertainmentcostTotal += int.parse((data['entertainmentcost'] ?? '0').toString());
                      //
                      //   // foodcostTotal += int.parse((document.data() as Map<String, dynamic>)['foodcost']);
                      //   // utilitycostTotal += int.parse((document.data() as Map<String, dynamic>)['utilitycost']);
                      //   // transportcostTotal += int.parse((document.data() as Map<String, dynamic>)['transportcost']);
                      //   // entertainmentcostTotal += int.parse((document.data() as Map<String, dynamic>)['entertainmentcost']);
                      //
                      //   // You can also display the data from each document individually here
                      //   // by adding them to a list and then displaying the list in your widget
                      // }
                      //       foodController.text = foodcostTotal.toString();
                      //       utilityController.text = utilitycostTotal.toString();
                      //       transportationController.text = transportcostTotal.toString();
                      //       entertainmentController.text = entertainmentcostTotal.toString();



                      snapshot.docs.forEach((document) {


                          final Map<String, dynamic> data = document.data() as Map<String, dynamic>;

                          // Add the cost of each category to their respective totals
                          foodcostTotal += int.parse((data['foodcost'] ??'0').toString());
                          utilitycostTotal += int.parse((data['utilitycost'] ??'0').toString());
                          transportcostTotal += int.parse((data['transportcost'] ??'0').toString());
                          entertainmentcostTotal += int.parse((data['entertainmentcost'] ??'0').toString());



                            foodController.text = foodcostTotal.toString();
                            utilityController.text = utilitycostTotal.toString();
                            transportationController.text = transportcostTotal.toString();
                            entertainmentController.text = entertainmentcostTotal.toString();

                      });



                    });

                  } else {
                    // No data was found for the selected date
                    setState(() {

                      // pickedDate = null;


                    });
                  }

                }
                // foodController.clear();
                // utilityController.clear();
                // transportationController.clear();
                // entertainmentController.clear();

                // Add your logic here for saving data to the database

              },

              child: Text('Show'),
            ),

          ],
        ),
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime(2030),
    );


    }
  }

