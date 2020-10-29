import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: CircleAvatar(child: Icon(Icons.person,color: primaryColor,),backgroundColor: Colors.white,radius: 12,),
            onPressed: (){},
          )
        ],
        centerTitle: true,
        title: Text('Settings',style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
        backgroundColor: primaryColor,
      ),
      drawer: SideNavDrawer(a: 4,),
    );
  }
}
