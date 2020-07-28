import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:greenway_demo/main.dart';
import 'package:greenway_demo/user.dart';
import 'entry.dart';

class Home extends StatelessWidget {
  const Home({Key key, this.user}) : super(key:key);
  final FirebaseUser user; 
  // 
    // final FirebaseUser user = await _auth.currentUser();
    // final userid = user.uid;
  void entry(BuildContext context)
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Entry()));    
  }
  Future signout() async
  {
    try
    {
      final FirebaseAuth _auth = FirebaseAuth.instance;
      return await _auth.signOut();     
    }
    catch(e)
    {
      print(e.message);
      return null;
    }
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Home'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign Out", style: TextStyle(fontSize: 18.0),),
            onPressed: () async {
              dynamic result = await signout();
              if(result == null)
              {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()  )   )   ;  
              }
            } ,
          ),
          FlatButton.icon(
            icon: Icon(Icons.edit),
            label: Text("ENTRY", style: TextStyle(fontSize: 18.0),),
            onPressed: ()  {
               Navigator.push(context, MaterialPageRoute(builder: (context)=>Entry()));
            } ,
          ),
          
        ],
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection('Users').document(user.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot){
        if (snapshot.hasError){
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.waiting: return new Text('Loading...');
          default:
          try {
            return Scaffold(
              body: Container( alignment: Alignment.centerLeft,
                // padding: EdgeInsets.only(top: 10.0, right: 0.0, left: 10.0, bottom: 20.0),
                child: Column(
                  
                  // crossAxisAlignment: CrossAxisAlignment.left,
                  children: <Widget>[
                    Text('Hello ${user.email}'+'\n Below are Details!',
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Colors.green,
                    )
                    ),
                    SizedBox(height: 20.0),
                    Text('StoveID: '+snapshot.data['StoveID'],
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.green,
                  ),
                  ),
                  SizedBox(height: 20.0),
                    Text('Name: '+snapshot.data['Name'],
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.green,
                  ),
                  ),
                  SizedBox(height: 20.0),
                    Text('Age: '+snapshot.data['Age'],
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.green,
                  ),
                  ),
                  SizedBox(height: 20.0),
                    Text('Gender: '+snapshot.data['Gender'].toString()+'|| 0: Male AND 1: Female',
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.green,
                  ),
                  ),
                  SizedBox(height: 20.0),
                    Text('Proof: '+snapshot.data['Proof'].toString(),
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Times New Roman",
                    color: Colors.green,
                  ),
                  ),


                  ],
                )
              ),
            );
            
          } catch (e) {
            print('error')
          }
            // return Text('Name: '+snapshot.data['Name']);
            
      }
      },
      ),
      
    );
  }
  
}
