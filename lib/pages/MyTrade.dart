import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';
class MyTrade extends StatefulWidget {
  @override
  _MyTradeState createState() => _MyTradeState();
}

class _MyTradeState extends State<MyTrade> {
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
        title: Text('My Trade',style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
        backgroundColor: primaryColor,
      ),
      drawer: SideNavDrawer(2),
    );
  }
}
