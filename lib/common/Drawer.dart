import 'package:flutter/material.dart';

Widget drawerApp(BuildContext context) {
  return (
      Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Курсы валют', style: TextStyle(fontSize: 20.0, color: Colors.white), textAlign: TextAlign.center,),

            decoration: BoxDecoration(
              color: Colors.black87,
            ),
          ),
          ListTile(
            title: Text('Курсы валют', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.attach_money),
            onTap: () {
              Navigator.pop(context);
              //Navigator.pushNamed(context, '/currency');
            },
          ),
          ListTile(
            title: Text('Конвертер', style: TextStyle(fontSize: 20.0)),
            leading: Icon(Icons.import_export),
            onTap: () {
              Navigator.pushNamed(context, '/converter');
            },
          )
        ],
      )
  ));
}