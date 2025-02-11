import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/Dashboard.dart';
import 'package:blocktrad/pages/MyTrade.dart';
import 'package:blocktrad/pages/MyWallet.dart';
import 'package:blocktrad/pages/Settings.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SideNavDrawer extends StatelessWidget {
  int a;
  String username;
  String name;
  SideNavDrawer({this.a,this.name,this.username});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          // color: primaryColor,
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors:[
              // Color(0xFFFFFFFF),
              Color(0xFF56CCF2),
              primaryColor,
            ],
            // stops: [
            //   0.0,0.5,1
            // ],
          ),
        ),
        child: ListView(
          children: [
            DrawerHeader(
              child:   Container(
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/placeholder.png'),
                    SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(this.name,style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
                          SizedBox(height: 10,),
                          Text(this.username,style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),overflow: TextOverflow.ellipsis,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Dashboard()));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: a==1?Border(left: BorderSide(color: Colors.white,width: 5
                    )):null
                ),
                child: ListTile(
                  title: Text('Dashboard',style: a==1?TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi',fontSize: 16): TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),),
                  leading: Icon(FontAwesomeIcons.home,color: Colors.white,),
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>MyTrade()));

              },
              child: Container(
                decoration: BoxDecoration(
                    border: a==2?Border(left: BorderSide(color: Colors.white,width: 5)):null
                ),
                child: ListTile(
                    title: Text('My Trade',style:a==2?TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi',fontSize: 16): TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),),
                    leading: Icon(FontAwesomeIcons.solidHandshake,color: Colors.white,)
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>MyWallet()));

              },
              child: Container(
                decoration: BoxDecoration(
                    border: a==3?Border(left: BorderSide(color: Colors.white,width: 5)):null
                ),
                child: ListTile(
                    title: Text('My Wallet',style:a==3?TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi',fontSize: 16): TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),),
                    leading: Icon(FontAwesomeIcons.wallet,color: Colors.white,)
                ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context)=>Settings()));
              },
              child: Container(
                decoration: BoxDecoration(
                    border: a==4?Border(left: BorderSide(color: Colors.white,width: 5)):null
                ),
                child: ListTile(
                    title: Text('Settings',style: a==4?TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi',fontSize: 16): TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),),
                    leading: Icon(FontAwesomeIcons.cog,color: Colors.white,)
                ),
              ),
            ),
            InkWell(
              child: Container(

                child: ListTile(
                    title: Text('Sign Out',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),),
                    leading: Icon(FontAwesomeIcons.signOutAlt,color: Colors.white,)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
