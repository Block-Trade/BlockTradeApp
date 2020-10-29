import 'dart:convert';

import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/konstants/loader.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:blocktrad/pages/SearchConsignee.dart';
import 'package:flutter/cupertino.dart';
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
  final storage = FlutterSecureStorage();
  bool load = true;
  String name;
  String username;
  bool importer=false;
  bool exporter=false;

  dialog() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (context,setState) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 310,
                    child: Center(
                      child: Scaffold(
                        body: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              'Define your role',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'OpenSansSemi',
                                  fontSize: 16),
                              textAlign: TextAlign.center,
                            )),
                            SizedBox(height: 30,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      importer=true;
                                      exporter=false;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(
                                          child: Image.asset('assets/images/importer.png'),
                                      // shadowColor: importer?primaryColor:null,
                                      shape: CircleBorder(),
                                      elevation: importer?10:0,),
                                      SizedBox(height: 10,),
                                      Text(
                                        'Importer',
                                        style: importer?TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16):TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'OpenSansSemi',
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    setState(() {
                                      exporter=true;
                                      importer=false;
                                    });
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Material(child: Image.asset('assets/images/exporter.png'),
                                        // shadowColor: exporter?primaryColor:null,
                                        shape: CircleBorder(),
                                        elevation: exporter?10:0,),
                                      SizedBox(height: 10,),
                                      Text(
                                        'Exporter',
                                        style: exporter?TextStyle(
                                            color: primaryColor,
                                            fontFamily: 'OpenSans',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16):TextStyle(
                                            color: Colors.black,
                                            fontFamily: 'OpenSansSemi',
                                            fontSize: 16),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20,),
                            GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchConsignee()));
                              },
                              child: Center(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: primaryColor,
                                      borderRadius: BorderRadius.circular(22),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                                      child: Text(
                                        'Next',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'OpenSansSemi',
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        });
  }

  makeRequest() async {
    String url = loginUrl;
    String accToken = await storage.read(key: 'accToken');
    print(accToken);
    Map<String, String> headers = {"token": "$accToken"};

    http.Response response = await http.get(url, headers: headers);
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      setState(() {
        name = decodedResponse['name'];
        username = decodedResponse['username'];
      });
      String tradeurl = tradeUrl;
      http.Response response1 = await http.get(tradeurl, headers: headers);
      if (response1.statusCode == 200) {
        setState(() {
          load = false;
        });
      } else {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (BuildContext context) => Login()),
            (route) => false);
      }
    } else {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (BuildContext context) => Login()),
          (route) => false);
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
    return load == true
        ? Container(
            child: spinkit,
            color: Colors.white,
          )
        : Scaffold(
            appBar: AppBar(
              actions: [
                IconButton(
                  icon: CircleAvatar(
                    child: Icon(
                      Icons.person,
                      color: primaryColor,
                    ),
                    backgroundColor: Colors.white,
                    radius: 12,
                  ),
                  onPressed: () {},
                )
              ],
              centerTitle: true,
              title: Text(
                'Dashboard',
                style:
                    TextStyle(color: Colors.white, fontFamily: 'OpenSansSemi'),
              ),
              backgroundColor: primaryColor,
            ),
            drawer: SideNavDrawer(
              a: 1,
              name: name,
              username: username,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: Image.asset('assets/images/dashboardimage.png')),
                Text(
                  'No trade history yet!',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 16),
                ),
                SizedBox(
                  height: 30,
                ),
                InkWell(
                  onTap: () {
                    // dialog();
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SearchConsignee()));

                  },
                  child: Material(
                    // elevation: 10,
                    shadowColor: Color(0x26000000),
                    child: Container(
                      width: 170,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0x26000000), blurRadius: 4)
                        ],
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(22),
                      ),
                      child: Center(
                        // child: ListTile(
                        //   leading: Icon(Icons.add,color: Colors.white,),
                        //   title: Text('New Trade',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans'),),
                        // ),
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'New Trade',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'OpenSansSemi',
                                    fontSize: 18),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
