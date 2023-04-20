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



  late final DateTime? pickedDate;
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
            ElevatedButton(
              onPressed: () {
                // Add your logic here for displaying date picker
                _showDatePicker(context);
              },
              child: Text('Choose Date'),

            ),
            SizedBox(height: 16.0),
            ElevatedButton(

              onPressed: () async {

                if (pickedDate != null) {

                  // Add your logic here for handling the picked date and fetching data from the database


                  // Convert the picked date into a Timestamp object
                  final pickedTimestamp = Timestamp.fromDate(pickedDate!);

                  // Query the categories collection for documents with a timestamp
                  // greater than or equal to the start of the picked date and less
                  // than the start of the next day
                  final querySnapshot = await usersRef.where('timestamp', isGreaterThanOrEqualTo: pickedTimestamp, isLessThan: Timestamp.fromDate(pickedDate!.add(Duration(days: 1)))).get();
                  // Update the state of the app to display the appropriate values
                  if (querySnapshot.docs.isNotEmpty) {
                    final data = querySnapshot.docs.first.data();
                    setState(() {


                      querySnapshot.docs.forEach((document) {


                        food = (document.data() as Map<String, dynamic>)['foodcost'].toString();
                        utility = (document.data() as Map<String, dynamic>)['utilitycost'].toString();
                        transportation = (document.data() as Map<String, dynamic>)['transportcost'].toString();
                        entertainment = (document.data() as Map<String, dynamic>)['entertainmentcost'].toString();

                        foodcost = double.parse((document.data() as Map<String, dynamic>)['foodcost']);
                        utilitycost = double.parse((document.data() as Map<String, dynamic>)['utilitycost']);
                        transportcost = double.parse((document.data() as Map<String, dynamic>)['transportcost']);
                        entertainmentcost = double.parse((document.data() as Map<String, dynamic>)['entertainmentcost']);

                        DateTime date = (document.data() as Map<String, dynamic>)['timestamp'].toDate();

                    if  (date.day == DateTime.now().day) {



                      foodcostTotal += foodcost;
                      utilitycostTotal += utilitycost;
                      transportcostTotal += transportcost;
                      entertainmentcostTotal += entertainmentcost;

                    }else if (date.day != DateTime.now().day){
                    }



                        foodController.text = foodcostTotal.toString();
                        utilityController.text = utilitycostTotal.toString();
                        transportationController.text = transportcostTotal.toString();
                        entertainmentController.text = entertainmentcostTotal.toString();
                      });
                    });

                  } else {
                    // No data was found for the selected date
                    setState(() {
                      food = 'No data available';
                      utility = 'No data available';
                      transportation = 'No data available';
                      entertainment = 'No data available';
                      foodController.text = food;
                      utilityController.text = utility;
                      transportationController.text = transportation;
                      entertainmentController.text = entertainment;
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
    );


    }
  }

