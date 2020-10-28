import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
        title: Text('Dashboard',style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
        backgroundColor: primaryColor,
      ),
      drawer: SideNavDrawer(1),
    );
  }
}

