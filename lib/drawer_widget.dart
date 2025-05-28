// drawer_widget.dart
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blueGrey[700],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('assets/logo.jpg'),
                ),
                SizedBox(height: 10),
                Text(
                  'Dividend Calculator',
                  style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              if (ModalRoute.of(context)?.settings.name != '/home') {
                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pushReplacementNamed(context, '/home');
                });
              }
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.pop(context); // Close drawer
              if (ModalRoute.of(context)?.settings.name != '/about') {
                Future.delayed(Duration(milliseconds: 200), () {
                  Navigator.pushReplacementNamed(context, '/about');
                });
              }
            },
          ),


        ],
      ),
    );
  }
}
