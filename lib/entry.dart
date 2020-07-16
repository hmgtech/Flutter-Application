import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Entry extends StatefulWidget {
  @override
  _EntryState createState() => _EntryState();
}

class _EntryState extends State<Entry> {
  int group;
  String dropdownvalue = "AdharCard";
  @override
  Widget build(BuildContext context) {
    
        // _handleRadioValueChange1(-1);
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
                        Text('Enter StoveID: ',
                        style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Colors.green,
                          ),
                          ),
                          TextField(),
                          Text('Enter Customer Name: ',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Colors.green,
                          ),),
                          TextField(),
                          Text('Enter Age: ',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Colors.green,
                          ),
                          ),
                          TextField(keyboardType: TextInputType.number,
                        inputFormatters: <TextInputFormatter>[
                        WhitelistingTextInputFormatter.digitsOnly
                        ],
                        ),
                        Text('Select Gender: ',
                          style: TextStyle(
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Colors.green,
                          ),
                          ),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Male',style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Colors.green,
                          ),),
                          Radio(value: 0, groupValue: group, onChanged: (T){
                            print(T);
                            setState(() {
                              group  = T;
                            });
                          }),
                      Text('Female',style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico",
                        color: Colors.green,
                      ),),
                      Radio(value: 1, groupValue: group, onChanged: (T){
                            print(T);
                            setState(() {
                              group  = T;
                            });
                          }),
                ],
              ),
              DropdownButton<String>(value: dropdownvalue,icon: Icon(Icons.arrow_downward),iconSize: 30,
                elevation: 16,
                style: TextStyle(color: Colors.deepPurple), items: <String>['AdharCard', 'PanCard', 'Passport', 'card4','card5','card6'].map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value, child: new Text(value),
                        );
                      }).toList(), onChanged: ((String newValue) {
                        setState(() 
                        {          dropdownvalue = newValue;  });
                      }),
                    ),          
       
          ]
          ),
      
      ),
      
    );
  }
}