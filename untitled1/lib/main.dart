

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:untitled1/kayitol.dart';
import 'package:untitled1/uyegiris.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.purpleAccent,
          body: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => UyeGiris()));
                }, child: Text("ÜYE GİRİŞ")),
                SizedBox(width: 25,),
                Text("HOSGELDINIZ",style: TextStyle(fontFamily: "Rancho",fontSize: 30),),
                SizedBox(width: 25,),
                ElevatedButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => KayitOl()));
                }, child: Text("KAYIT OL")),
              ],
            ),
          ),
        ),
      ),
    );
  }
}




