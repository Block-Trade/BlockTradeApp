import 'dart:convert';

import 'package:http/http.dart';
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
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'login.dart';
import 'package:intl/intl.dart';
import 'package:currency_pickers/countries.dart';
import 'package:currency_pickers/country.dart';
import 'package:web3dart/web3dart.dart';

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
  List trades;
  Country country;
  List completedTrades;
  Map fulForm={
    "DU":"Document Uploaded",
    "DV":"Document Verification",
    "GL":"Goods Laided",
    "GD":"Goods Delivered",
    "PD":"Payment Done"
  };
  Client httpClient;
  Web3Client ethClient;
  final myAddress="0x5A8ed9980C09857eF9F2f186316457935245702c";
  var myData;



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
      await storage.write(key: 'username', value: username);
      await storage.write(key: 'name', value: name);
      String tradeurl = tradeUrl;
      http.Response response1 = await http.get(tradeurl, headers: headers);
      if (response1.statusCode == 200) {
        trades=List();
        completedTrades=List();

          List list=jsonDecode(response1.body)['trades'] as List;
          for(int i=0;i<list.length;i++){
            if(list[i]['tradeStatus']=='PD'){
              completedTrades.add(list[i]);
            }else{
              trades.add(list[i]);
            }
          }
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
        : trades.length==0?Scaffold(
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
          ):Scaffold(
      appBar:  AppBar(
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
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 20),
                    child: Align(child: Text('Ongoing Trades',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 18),),alignment: Alignment.topLeft,),
                  ),
                 SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 250,
                      child: PageView.builder(
                        pageSnapping: true,
                        itemBuilder: (BuildContext context,int pos){
                          country=Country(currencyCode: trades[pos]['amount'].toString().substring(0,3));
                          print(trades[pos]['amount'].toString().substring(0,3));
                          print(country.name);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.white,
                                  Color(0xFF3799F3),
                                ],
                              )
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8,top: 20,right: 8,bottom: 5),
                                  child: LinearPercentIndicator(
                                    // maskFilter: MaskFilter.blur(_style, _sigma),
                                    // width: MediaQuery.of(context

                                    // ).size.width-50,
                                    restartAnimation: true,
                                    animation: true,
                                    animationDuration: 1000,
                                    lineHeight: 5.0,
                                    // trailing: Text(fulForm[trades[pos]['tradeStatus']],style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                    // trailing: new Text("right content"),
                                    percent: 0.2,
                                    // center: Text("20.0%",style: TextStyle(color: Colors.red),),
                                    linearStrokeCap: LinearStrokeCap.round,
                                    progressColor: primaryColor,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(child: Text(
                                    "Status : ${
                                                    fulForm[trades[pos]
                                                        ['tradeStatus']]
                                                  }",style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),alignment: Alignment.bottomRight,),
                                ),
                                Divider(color: Colors.grey.shade500,),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Column(
                                        children: [
                                          Image.asset('assets/images/importer.png',height: 100,width: 100,),
                                          SizedBox(height: 10,),
                                          Text(username==trades[pos]['importerUserName']?trades[pos]['exporterUserName'].toString().toUpperCase():trades[pos]['importerUserName'].toString().toUpperCase(),style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                        ],
                                      ),
                                     Expanded(
                                       child: Table(
                                         columnWidths: {
                                           0:FlexColumnWidth(1),
                                           1:FlexColumnWidth(2),
                                         },
                                         children: [
                                           TableRow(
                                             children: [
                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text('Trade ID',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                               ),

                                               Padding(
                                                 padding: const EdgeInsets.all(8.0),
                                                 child: Text(trades[pos]['TradeId'],overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                               ),
                                             ]
                                           ),
                                           TableRow(
                                               children: [
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text('Status',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text(trades[pos]
                                                   ['tradeStatus'],overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                 ),
                                               ]
                                           ),
                                           TableRow(
                                               children: [
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text('Invoice Date',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                 ),
                                                 Padding(
                                                   padding: const EdgeInsets.all(8.0),
                                                   child: Text(DateFormat.yMMMEd().format(DateTime.parse(trades[pos]
                                                   ['invoiceDate'])),overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                 ),
                                               ]
                                           ),
                                           // TableRow(
                                           //     children: [
                                           //       Padding(
                                           //         padding: const EdgeInsets.all(8.0),
                                           //         child: Text('Amount',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                           //       ),
                                           //       Padding(
                                           //         padding: const EdgeInsets.all(8.0),
                                           //         child: Text((trades[pos]
                                           //         ['amount']),overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                           //       ),
                                           //     ]
                                           // ),
                                         ],
                                       ),
                                     )
                                    ],
                                  ),
                                )
                              ],
                            ),
                            ),
                          );
                        },
                        itemCount: trades.length,
                        // pageSnapping: false,
                      ),
                    ),
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(child: Text('Completed Trades',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 18),),alignment: Alignment.topLeft,),
                  ),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      height: 250,
                      child: PageView.builder(
                        pageSnapping: true,
                        itemBuilder: (BuildContext context,int pos){
                          country=Country(currencyCode: completedTrades[pos]['amount'].toString().substring(0,3));
                          print(completedTrades[pos]['amount'].toString().substring(0,3));
                          print(country.name);
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Container(decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    Color(0xFF3799F3),
                                  ],
                                )
                            ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8,top: 20,right: 8,bottom: 5),
                                    child: LinearPercentIndicator(
                                      // maskFilter: MaskFilter.blur(_style, _sigma),
                                      // width: MediaQuery.of(context

                                      // ).size.width-50,
                                      restartAnimation: true,
                                      animation: true,
                                      animationDuration: 1000,
                                      lineHeight: 5.0,
                                      // trailing: Text(fulForm[trades[pos]['tradeStatus']],style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                      // trailing: new Text("right content"),
                                      percent: 0.2,
                                      // center: Text("20.0%",style: TextStyle(color: Colors.red),),
                                      linearStrokeCap: LinearStrokeCap.round,
                                      progressColor: primaryColor,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Align(child: Text(
                                      "Status : ${
                                          fulForm[completedTrades[pos]
                                          ['tradeStatus']]
                                      }",style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),alignment: Alignment.bottomRight,),
                                  ),
                                  Divider(color: Colors.grey.shade500,),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Column(
                                          children: [
                                            Image.asset('assets/images/importer.png',height: 100,width: 100,),
                                            SizedBox(height: 10,),
                                            Text(username==completedTrades[pos]['importerUserName']?completedTrades[pos]['exporterUserName'].toString().toUpperCase():completedTrades[pos]['importerUserName'].toString().toUpperCase(),style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                          ],
                                        ),
                                        Expanded(
                                          child: Table(
                                            columnWidths: {
                                              0:FlexColumnWidth(1),
                                              1:FlexColumnWidth(2),
                                            },
                                            children: [
                                              TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Trade ID',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),

                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(completedTrades[pos]['TradeId'],overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Status',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(completedTrades[pos]
                                                      ['tradeStatus'],overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),
                                                  ]
                                              ),
                                              TableRow(
                                                  children: [
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text('Invoice Date',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Text(DateFormat.yMMMEd().format(DateTime.parse(completedTrades[pos]
                                                      ['invoiceDate'])),overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                                    ),
                                                  ]
                                              ),
                                              // TableRow(
                                              //     children: [
                                              //       Padding(
                                              //         padding: const EdgeInsets.all(8.0),
                                              //         child: Text('Amount',style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                              //       ),
                                              //       Padding(
                                              //         padding: const EdgeInsets.all(8.0),
                                              //         child: Text((trades[pos]
                                              //         ['amount']),overflow: TextOverflow.ellipsis,style: TextStyle(color: Colors.black, fontFamily: 'OpenSansSemi',fontSize: 14),),
                                              //       ),
                                              //     ]
                                              // ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        itemCount: completedTrades.length,
                        // pageSnapping: false,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
