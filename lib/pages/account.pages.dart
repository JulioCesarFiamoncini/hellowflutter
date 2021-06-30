import 'package:flutter/material.dart';

TextEditingController loginController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();


class AccountPages extends StatefulWidget{
  @override
  _AccountPages createState() => _AccountPages();

}

class _AccountPages extends State<AccountPages> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      home: Scaffold(
        appBar: AppBar(
          title: Text('App Bar'),
        ),
        drawer: Drawer(),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Settings'),
            )
          ],
        ),
      ),
    );
  }
  }
