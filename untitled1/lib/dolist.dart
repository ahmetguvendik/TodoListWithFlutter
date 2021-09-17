import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/uyegiris.dart';
import 'package:untitled1/yapilacakgosterme.dart';

TextEditingController controller = TextEditingController();
class DoList extends StatelessWidget {
   String t1;
   DoList({required this.t1});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.purpleAccent,
        appBar: AppBar(
            backgroundColor: Colors.purpleAccent,
            elevation: 0,
          actions: [
            IconButton(
              icon: Icon(Icons.follow_the_signs),
              onPressed: (){
                FirebaseAuth.instance.signOut().then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => UyeGiris()), (route) => false));
              },),
          ],
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
                  child: Text("YAPILACAKLAR",style: TextStyle(fontFamily: "Rancho",fontSize: 30),),
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
                  controller: controller,
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: 'YAPILACAK',
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(onPressed: () async{
                 await FirebaseFirestore.instance.collection("Kullanicilar").doc(t1).collection("dolist").doc(controller.text).set(
                    {"data":controller.text}
                  ).whenComplete(() => Fluttertoast.showToast(
                      msg: "KAYIT BAŞARILI",
                      toastLength: Toast.LENGTH_LONG,
                      gravity: ToastGravity.CENTER
                  ));
              }, child: Text("KAYDET")),
              ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>VeriCek(t1: t1)));
              }, child: Text("YAPİLACAK GÖSTER")),
            ],
          ),
        ),
      ),
    );
  }
}
