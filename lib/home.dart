import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/latast_expense.dart';
import 'package:project/pie_chart.dart';

class Myhome extends StatefulWidget {
  static const String id = 'home';

  @override
  _MyhomeState createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signOut() async {
    await _auth.signOut();
    // Navigate to login screen after sign-out
    Navigator.pushNamed(context, "login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey[800],
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.question_mark,
              color: Colors.white,
            ),
            onPressed: () {
              // Show tips dialog
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text(
                      'Tips',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    content: const Text(
                      '1. Cook at home: Eating out can be expensive. Cooking at home can save you money and also give you control over the ingredients you use.\n'
                          '2. Bring your own lunch: Bringing your own lunch to work or school can save you money on expensive takeout options.',
                    ),
                    actions: [
                      TextButton(
                        child: const Text('Close'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      )
                    ],
                  );
                },
              );
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ),
            onPressed: _signOut, // Call _signOut method on button press
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              SizedBox(
                child: Mypiechart(),
                height: 250.0,
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: const Text(
                  'Latest Expense',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          ),
          Column(
            children: [
              LatestExpense(),
            ],
          ),
        ],
      ),
    );
  }
}
