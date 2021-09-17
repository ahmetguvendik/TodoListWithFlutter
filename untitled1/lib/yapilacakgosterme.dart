import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VeriCek extends StatelessWidget {
    String t1;
    VeriCek({required this.t1});

  @override
  Widget build(BuildContext context) {
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
        body: Column(
          children: [
            StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection("Kullanicilar").doc(t1).collection("dolist").snapshots(),
                builder: (BuildContext context , AsyncSnapshot async){
                  if(async.hasError){
                    return Center(child: Text("Bir hata Oluştu, Lütfen Daha Sonra Tekrar Deneyiniz"),);
                  }
                  else{
                    if(async.hasData){
                      final  List liste = async.data!.docs;
                      return Flexible(
                        child: ListView.builder(
                            itemCount: liste.length,
                            itemBuilder: (context,index){
                              return Card(
                                color: Colors.blue,
                                child: ListTile(
                                  title: Text(liste[index].data()["data"].toString(),style: TextStyle(color: Colors.white),),
                                  trailing: IconButton(
                                    icon: Icon(Icons.delete),
                                    onPressed: () {
                                      liste[index].reference.delete();
                                    },
                                  ),
                                ),
                              );
                            } ),
                      );
                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }

                })
          ],
        ),
      ),
    );
  }
}
