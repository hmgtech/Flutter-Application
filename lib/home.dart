import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenway_demo/main.dart';
import 'entry.dart';

class Home extends StatefulWidget {
  const Home({Key key, this.user}) : super(key:key);
  final FirebaseUser user;
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void entry()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>Entry()));    
  }
  Future signout() async
  {
    try
    {
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
        title: Text('Description'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text("Sign Out", style: TextStyle(fontSize: 18.0),),
            onPressed: () async {
              // dynamic result = await signout();
              // if(result == null)
              // {
              //   Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()  )   )   ;  
              // }
            } ,
          ),
          
        ],
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
  }
}
