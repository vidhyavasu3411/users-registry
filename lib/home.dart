import 'dart:convert';
import 'dart:developer';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:users_reg/login.dart';
import 'package:users_reg/signup.dart';

final name = storage.getItem('info');

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState();
  }
}



class HomePageState extends State<HomePage> {

  var location;
  var family;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(Icons.person,size: 50.0,),
              ),
              accountName: Text('$usernamedata'),
              accountEmail: Text('examlpe@gmail.com'),
            ),
            ListTile(
              leading: CircleAvatar(
                child: Icon(Icons.person_outline,
                  color: Colors.white,
                  size: 30.0,
                ),
              ),
              title: Text("Profile Settings"),
              onTap: (){

              },
            ),

          ],
        ),
      ),

      appBar: AppBar(
        title: Text("Home Page"),
        centerTitle: true,
        actions: <Widget>[
      FlatButton(
      textColor: Colors.white,
        onPressed: () {        Navigator.of(context).push(
            MaterialPageRoute<Null>(
                builder:
                    (
                    BuildContext context) {
                  // _LogedinSuccess();
                  return new LoginPage();
                })); },
        child: Text("LOG OUT"),
        shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
      ),]
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff6bceff),
        onPressed: () {
        },
        child: Icon(Icons.add,color:Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Color(0xff6bceff),),
            title: Text('Home',style: TextStyle(
              color: Color(0xff6bceff),
            ),),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            title: Text('Historique'),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(50)),
            ),
            child: ListTile(

              title: Text("WELCOME" + "$usernamedata"),

            ),
          ),
          Center(
              child: FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                splashColor: Colors.blueAccent,
                onPressed: () {
                              setState(() {
                                var name = storage.getItem('usernamedata'); // Abolfazl
                                family = storage.getItem('location'); // Roshanzamir
                                log("naaaaaaaaaaaaa$name");
                                log("familyyyyyyyyy$family");
                                Map<String, dynamic> info = json.decode(storage.getItem('info'));
                                final info_name = info['name'];
                                final info_location = info['location'];

                                location = family;
                                log("eeeeeeeeeerrrrrrrrr$info");
                              });
                },
                child: Text(
                  "Display the Location",
                  style: TextStyle(fontSize: 20.0),
                ),
              ),

          ),
          Container(
            decoration: BoxDecoration(
              borderRadius:  BorderRadius.all(Radius.circular(50)),
            ),
            child: ListTile(

              title:  Text("$family"),

            ),
          ),
        ],
      ),
    );
  }
}