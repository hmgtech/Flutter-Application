import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'entry.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key:key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void entry()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Entry()));    
  }
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
       resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Description'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 1.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('Details Fetched',
            style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.green,
              ),
              ),
              Container(
              alignment: Alignment.bottomCenter,
              // padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
              child: RaisedButton(
              
                onPressed: entry,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.redAccent)),
              child: Text("Entry", style: TextStyle(fontSize: 24.0),),
              textColor: Colors.white,
              color: Colors.green,
              splashColor: Colors.cyan,),
              ),
          ]
          ),
      
      ),
    );
  }
}