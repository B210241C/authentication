import 'package:flutter/material.dart';
import 'package:authentication/login.dart';
import 'package:authentication/register.dart';
import 'package:authentication/home.dart';

void main() {
  runApp(ExpenseApp());
}

class ExpenseApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      initialRoute: MyLogin.id,
      routes: {
        MyLogin.id: (context) => MyLogin(),
        MyRegister.id: (context) => MyRegister(),
        Myhome.id:(context) => Myhome(),
      },
    );
  }
}

