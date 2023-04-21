//import 'dart:ffi';

import 'dart:math';

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



  late DateTime? pickedDate;
  late DateTime selectedDate = DateTime.now();
  String entertainmentcostString = '';
  static String id = 'SummarySpend';

  double foodcost = 0.0;
  double utilitycost = 0.0;
  double transportcost = 0.0;
  double entertainmentcost = 0.0;

  static double foodcostTotal = 0.0;
  static double utilitycostTotal = 0.0;
  static double transportcostTotal = 0.0;
  static double entertainmentcostTotal = 0.0;

  String selectedPeriod = 'Daily'; // Default selected period is 'Daily'
  double summary = 50.0; // Pre-filled data for Summary (as a percentage)
  String food = 'Food Data'; // Pre-filled data for Food
  String utility = 'Utility Data'; // Pre-filled data for Utility
  String entertainment = 'Entertainment Data'; // Pre-filled data for Entertainment
  String transportation = 'Transportation Data'; // Pre-filled data for Transportation
  // late final messageWidget;
  // List<Text> messagesWidget = [];

  //Controller for each text field
  TextEditingController foodController = TextEditingController();
  TextEditingController utilityController = TextEditingController();
  TextEditingController transportationController = TextEditingController();
  TextEditingController entertainmentController = TextEditingController();

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



            // pop put calander to select date
            SizedBox(height: 16.0),

            //display selected date
            Text('Selected Date: ${selectedDate.toString()}'),



            ElevatedButton(
              onPressed: () {
                // Add your logic here for displaying date picker
                _showDatePicker(context);

                // Initialize the values of all categories to zero
                foodcostTotal = 0.0;
                utilitycostTotal = 0.0;
                transportcostTotal = 0.0;
                entertainmentcostTotal = 0.0;



                foodController.clear();
                utilityController.clear();
                transportationController.clear();
                entertainmentController.clear();


                selectedDate = selectedDate ?? DateTime.now();

              },
              child: Text('Choose Date'),


            ),




            SizedBox(height: 16.0),
            //button to show summary
            ElevatedButton(

              onPressed: () async {

                if (pickedDate != null  && pickedDate!= selectedDate) {


                  // Convert the picked date into a Timestamp object
                  final pickedTimestamp = Timestamp.fromDate(pickedDate!);

                  // Query the categories collection for documents with a timestamp
                  // greater than or equal to the start of the picked date and less
                  // than the start of the next day
                  QuerySnapshot snapshot = await usersRef.where('timestamp', isGreaterThanOrEqualTo: pickedTimestamp, isLessThan: Timestamp.fromDate(pickedDate!.add(Duration(days: 1)))).get();


                  // // Set the start time to the beginning of the selected day
                  // DateTime startTime = DateTime(pickedDate!.year, pickedDate!.month, pickedDate!.day, 0, 0, 0);
                  //
                  // // Set the end time to the end of the selected day
                  // DateTime endTime = DateTime(pickedDate!.year, pickedDate!.month, pickedDate!.day, 23, 59, 59);
                  //
                  // // Convert the start and end times to Timestamp objects
                  // final startTimestamp = Timestamp.fromDate(startTime);
                  // final endTimestamp = Timestamp.fromDate(endTime);
                  //
                  // // Query the categories collection for documents with a timestamp
                  // // greater than or equal to the start of the selected day and less
                  // // than the end of the selected day
                  // QuerySnapshot snapshot = await usersRef.where('timestamp', isGreaterThanOrEqualTo: startTimestamp, isLessThanOrEqualTo: endTimestamp).get();


                  // Update the state of the app to display the appropriate values
                  if (snapshot.docs.isNotEmpty) {

                    setState(() {

                      selectedDate = pickedDate ?? selectedDate;

                      // Initialize the values of all categories to zero
                      foodcostTotal = 0.0;
                      utilitycostTotal = 0.0;
                      transportcostTotal = 0.0;
                      entertainmentcostTotal = 0.0;


                      snapshot.docs.forEach((document) {


                          final Map<String, dynamic> data = document.data() as Map<String, dynamic>;



                          // Add the cost of each category to their respective totals ,if nothing it will return 0
                          foodcostTotal +=  double.parse(data['foodcost']?.toString() ?? '0');
                          utilitycostTotal += double.parse(data['utilitycost'].toString() ?? '0');
                          transportcostTotal += double.parse(data['transportcost'].toString() ??'0');
                          entertainmentcostTotal += double.parse(data['entertainmentcost'].toString() ??'0');



                            foodController.text = foodcostTotal.toString();
                            utilityController.text = utilitycostTotal.toString();
                            transportationController.text = transportcostTotal.toString();
                            entertainmentController.text = entertainmentcostTotal.toString();

                      });

                      pickedDate = DateTime.now();



                    });

                  } else {
                    // No data was found for the selected date
                    setState(() {

                      //show 0 in the text field
                      foodController.text = foodcostTotal.toString() ?? '0';
                      utilityController.text = utilitycostTotal.toString() ?? '0';
                      transportationController.text = transportcostTotal.toString() ?? '0';
                      entertainmentController.text = entertainmentcostTotal.toString() ?? '0';


                    });
                  }

                }

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
      helpText: 'Select a date between 2021 and 2030',
    );


    }
  }

