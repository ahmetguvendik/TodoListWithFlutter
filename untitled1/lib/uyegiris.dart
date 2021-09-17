import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:untitled1/dolist.dart';

class UyeGiris extends StatefulWidget{
  @override
  State<UyeGiris> createState() => _UyeGirisState();
}

class _UyeGirisState extends State<UyeGiris> {
    TextEditingController t1 = TextEditingController();

    TextEditingController t2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
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
                  child: Text("ÜYE GIRISI",style: TextStyle(fontFamily: "Rancho",fontSize: 30),),
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
                  maxLength: 40,
                  decoration: InputDecoration(
                    hintText: 'ŞİFRE',
                    border: InputBorder.none,
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: ()async{
                      try{
                       await FirebaseAuth.instance.signInWithEmailAndPassword(email: t1.text, password: t2.text).then((value) => Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> DoList(t1: t1.text,)), (route) => false));
                      }
                      catch(e){
                        setState(() {
                          Fluttertoast.showToast(
                              gravity: ToastGravity.CENTER,
                              toastLength: Toast.LENGTH_LONG,
                              msg: "HATA: "+ e.toString());
                        });
                      }
                    }, child: Text("Giriş"))
            ],
          ),
        ),
      ),
    );
  }
}
//context, MaterialPageRoute(builder: (context)=> DoList(t1: t1.text,)))