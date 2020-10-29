import 'dart:convert';

import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/konstants/loader.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'login.dart';
class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  final storage=FlutterSecureStorage();
  bool load=true;
  String name;
  String username;



  makeRequest()async{
    String url=loginUrl;
    String accToken=await storage.read(key: 'accToken');
    print(accToken);
    Map<String,String>headers={
      "token":"$accToken"
    };

    http.Response response=await http.get(url,headers:headers );
    if(response.statusCode==200){
      var decodedResponse=jsonDecode(response.body);
      setState(() {
        name=decodedResponse['name'];
        username=decodedResponse['username'];
      });
      String tradeurl=tradeUrl;
      http.Response response1=await http.get(tradeurl,headers: headers);
      if(response1.statusCode==200){
        setState(() {
          load=false;
        });
      }else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Login()), (route) => false);
      }
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Login()), (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    makeRequest();
  }


  @override
  Widget build(BuildContext context) {
    return load==true?Container(child: spinkit,color: Colors.white,):Scaffold(
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
      drawer: SideNavDrawer(a: 1,name: name,username: username,),
    );
  }
}

