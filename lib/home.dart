import 'package:flutter/material.dart';
import 'package:authentication/latast_expense.dart';
import 'package:authentication/pie_chart.dart';
class Myhome extends StatelessWidget {
  static String id = 'home';

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      title: 'Expense Tracker',
      home: Scaffold(
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
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: const Text(
                            'Tips',
                            style:TextStyle(
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          content: const Text(
                              '1. Cook at home: Eating out can be expensive. Cooking at home can save you money and also give you control over the ingredients you use.\n'
                                  '2. Bring your own lunch: Bringing your own lunch to work or school can save you money on expensive takeout options.'
                          ),
                          actions: [
                            TextButton(
                              child: const Text('Close'),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            )
                          ],
                        );
                      });
                }
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children:[
            Column(
              children:[
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
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              ],
            ),
            Column(
              children: [
                LatestExpense()
              ],
            ),
            Column(
              children: [
                SizedBox.fromSize(
                  size: Size(56, 56),
                  child: ClipOval(
                    child: Material(
                      color: Colors.amberAccent,
                      child: InkWell(
                        splashColor: Colors.green,
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:  <Widget>[
                            IconButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.pushNamed(context,'Insert');
                              },
                              icon: const Icon(Icons.arrow_forward),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
