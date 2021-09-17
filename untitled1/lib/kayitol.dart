import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class KayitOl extends StatefulWidget{
  @override
  State<KayitOl> createState() => _KayitOlState();
}

class _KayitOlState extends State<KayitOl> {
  TextEditingController t1 = TextEditingController();

  TextEditingController t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
           backgroundColor: Colors.purpleAccent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.backspace),
            onPressed: (){
              Navigator.pop(context);
            },
          )
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120,right: 150),
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                        color: Colors.redAccent,// set border color
                        width: 3.0),   // set border width
                    borderRadius: BorderRadius.all(
                        Radius.circular(10.0)), // set rounded corner radius
                  ),
                  child: Text("KAYIT OLUN",style: TextStyle(fontFamily: "Rancho",fontSize: 30),),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.red,// set border color
                      width: 3.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextFormField(
                  controller: t1,
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: 'E MAİL',
                    border: InputBorder.none,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                      color: Colors.red,// set border color
                      width: 3.0),   // set border width
                  borderRadius: BorderRadius.all(
                      Radius.circular(10.0)), // set rounded corner radius
                ),
                child: TextFormField(
                  controller: t2,
                  obscureText: true,
                  maxLength: 15,
                  decoration: InputDecoration(
                    hintText: 'ŞİFRE',
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async{
                   try{
                     await FirebaseAuth.instance.createUserWithEmailAndPassword(email: t1.text, password: t2.text).then((value) => FirebaseFirestore.instance.collection("Kullanicilar").doc(t1.text).set(
                         {"KullaniciEposta":t1.text,
                           "KullaniciSifre": t2.text}
                     ).whenComplete(() => Fluttertoast.showToast(
                         msg: "KAYIT BAŞARILI",
                         toastLength: Toast.LENGTH_LONG,
                         gravity: ToastGravity.CENTER
                     )));
                   }
                    catch(e){
                     setState(() {
                       Fluttertoast.showToast(
                           timeInSecForIosWeb: 2,
                           gravity: ToastGravity.CENTER,
                           toastLength: Toast.LENGTH_LONG,
                           msg: "HATA: "+ e.toString());
                     });
                    }
                  }, child: Text("KAYIT OL"))
            ],
          ),
        ),
      ),
    );
  }
}