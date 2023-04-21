import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/firebase_options.dart';
import 'package:project/login.dart';
import 'package:project/register.dart';
import 'package:project/home.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

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
        Insert.id:(context)=> InsertPage(),
        SummarySpend.id:(context)=> MyPage(),


      },
    );
  }
}