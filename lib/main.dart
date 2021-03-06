import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:greenway_demo/entry.dart';
import 'home.dart';
import 'user.dart';
import 'shared/loading.dart';
import 'register.dart';
void main() => runApp(App());

class App extends StatelessWidget
{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(debugShowCheckedModeBanner: false, theme: ThemeData(primaryColor: Color(0xFFFB415B),fontFamily: "Ubuntu"),home: LoginPage(),);
  }
}

class LoginPage extends StatefulWidget{
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
{
  String email="Default";
  String password="Default";
  String texttodisplay = "";
  bool _isHidden = true;
  String error = '';
  bool loading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _userFromFirebaseUser(FirebaseUser user)
  {
    return user != null ? User(uid: user.uid) : null;
  }
  void showtext()
  {
    setState(() 
    {
      texttodisplay = email+'\n'+password;      
    });
  }

  Future signIn(String email,String password) async
  {
    try
    {
      print("Helloo1");
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user  = result.user;
      // _EntryState(uid: user.uid).print1();
      print(user.uid);

      return _userFromFirebaseUser(user);
      // final FirebaseAuth _auth = FirebaseAuth.instance;
      // final FirebaseUser user = (await _auth.signInWithEmailAndPassword(email, email));
      // print("Helloo:");
      // AuthResult result = await  FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      // FirebaseUser user = result.user;
      // print(user);
      // Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));        
      
    }
    catch(e)
    {
      // Container(child: Text("Invalid Username or password!"));
      print(e.message);
      return null;
    }
  }

  void _toggleVisibility(){
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context){
    return loading ? Loading() : Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Container(
        padding: EdgeInsets.only(top: 100.0, right: 20.0, left: 20.0, bottom: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Greenway",
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.green,
              ),
            ),
            SizedBox(height: 40.0,),
            Text(
              "LOGIN",
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor
              ),
            ),
            SizedBox(height: 40.0,),
            Text("$texttodisplay"),
            TextField(
              onChanged: (text){
                email = text;
              },
              decoration: InputDecoration(
                
                hintText: "Email",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.email),
                
              ),
              
            ),
            SizedBox(height: 20.0,),
            TextField(
              onChanged: (text){
                password = text;
              },
              decoration: InputDecoration(
                hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
                ),
              ),
              obscureText: _isHidden,
            ),
            
            SizedBox(height: 20.0,),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "Forgotten Password?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            
            Container(
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(23.0),
                    
              ),
              
              
            child: SizedBox(height: 50.0, width: MediaQuery.of(context).size.width,
            
            
            child: RaisedButton(
              
              onPressed: () async
              {
                print("Helloo");
                setState(() => loading = true);
                dynamic result = await signIn(email, password);
                print("Helloo");
                if(result == null)
                {
                  setState(() => loading = false);
                  error = 'Invalid Email or Password';
                }
                
                else
                {
                  AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
                  FirebaseUser user  = result.user;
                  print(user.uid);
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(user:user)));  
                }
              }, 
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0),
              side: BorderSide(color: Colors.redAccent)),
              child: Text("LOGIN", style: TextStyle(fontSize: 24.0),),
              textColor: Colors.white,
              color: Colors.green,
              splashColor: Colors.cyan,  
              ),
              ),
              
              
            ),
            SizedBox(height: 10.0,),
            Container(
                child: Text(error, style: TextStyle(color: Colors.red, fontSize: 16.0),),
                ),
                SizedBox(height: 10.0,),
                        Container(
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text("Don't have an account?",style: TextStyle(fontSize: 18.0)),
                                SizedBox(width: 10.0,),
                                
                                FlatButton(onPressed: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Register())); 
                                },splashColor: Colors.green, child: Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 18.0))),
                                // Text("SIGN UP", style: TextStyle(color: Theme.of(context).primaryColor,))
                                SizedBox(width: 10.0),
                                                                                            
                              ],
                            ),
                            
                          ),
                        ),
                        
                      ],
                    ),
                  ),
                );
              }
            
              // Widget buildTextField(String hintText){
              //   return TextField(
              //     decoration: InputDecoration(
              //       hintText: hintText,
              //       hintStyle: TextStyle(
              //         color: Colors.grey,
              //         fontSize: 16.0,
              //       ),
              //       border: OutlineInputBorder(
              //         borderRadius: BorderRadius.circular(20.0),
              //       ),
              //       prefixIcon: hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
              //       suffixIcon: hintText == "Password" ? IconButton(
              //         onPressed: _toggleVisibility,
              //         icon: _isHidden ? Icon(Icons.visibility_off) : Icon(Icons.visibility),
              //       ) : null,
              //     ),
              //     obscureText: hintText == "Password" ? _isHidden : false,
              //   );
              // }
            
              // Widget buildButtonContainer(){
              //   return Container(
              //     height: 56.0,
              //     width: MediaQuery.of(context).size.width,
              //     decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(23.0),
              //       gradient: LinearGradient(
              //         colors: [
              //           Color(0xFFFB415B),
              //           Color(0xFFEE5623)
              //         ],
              //         begin: Alignment.centerRight,
              //         end: Alignment.centerLeft
              //       ),
              //     ),
                  
              //     child: Center(
              //       child: Text(
              //         "LOGIN",
              //         style: TextStyle(
              //           color: Colors.white,
              //           fontSize: 18.0,
              //         ),
              //       ),
              //     ),
              //   );
            
              // }
            
              
}
