import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';

class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {
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
        title: Text('Wallet',style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
        backgroundColor: primaryColor,
      ),
      drawer: SideNavDrawer(3),
    );
  }
}
