import 'dart:convert';

import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/konstants/loader.dart';
import 'package:blocktrad/pages/TradeDoc/TradeDoc1.dart';
import 'package:blocktrad/pages/TradeInitiation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SearchConsignee extends StatefulWidget {
  @override
  _SearchConsigneeState createState() => _SearchConsigneeState();
}

class _SearchConsigneeState extends State<SearchConsignee> {

  final storage=FlutterSecureStorage();
  String cUname;
  bool load=false;

  makeRequest()async{
    // setState(() {
    //   load=true;
    // });
    String url=searchUrl;
    String accToken=await storage.read(key: 'accToken');
    Map<String,String>header={
      "token":"$accToken"
    };
    http.Response response=await http.get(url,headers: header);
    if(response.statusCode==200){
      bool flag=false;
      List list=jsonDecode(response.body)['users'] as List;
      for(int i=0;i<list.length;i++){
        if(list[i]['username']==cUname){
          // Fluttertoast.showToast(msg: 'Found User');
          print(list[i]['username']);
          print(cUname);
          flag=true;
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc1(cUname: cUname,)));
          break;
          // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeInitiation(userDetails: list[i],)));
        }
      }
      if(!flag){
        Fluttertoast.showToast(msg: 'Enter correct username');
      }
    }else{
      Fluttertoast.showToast(msg: 'Please Try Again');
    }

  }


  @override
  Widget build(BuildContext context) {
    return load==true?spinkit:Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF111F7B),
        leading: IconButton(icon: Icon(Icons.arrow_back_ios,color: Colors.white,),onPressed: (){
          Navigator.pop(context);
        },),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/searchImage.png'),
            SizedBox(height: 20,),
            Text('Search Importer',style:TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSansSemi',
                fontSize: 18),),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10,vertical:15 ),
                          child: TextFormField(
                            onChanged: (val){
                              setState(() {
                                cUname=val;
                              });
                            },
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSansSemi',
                                fontSize: 16),
                            decoration: InputDecoration.collapsed(
                              // suffix: Icon(Icons.search,color: primaryColor,),
                              // suffixIcon: Icon(Icons.search,color: primaryColor,),
                              // contentPadding: EdgeInsets.only(left: 10),
                              hintText: 'Importer’s Username',
                              hintStyle: TextStyle(
                                  color: Colors.grey.shade500,
                                  fontFamily: 'OpenSansSemi',
                                  fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.search,color: primaryColor,),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 40,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: GestureDetector(
                onTap: ()async{
                  await makeRequest();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.white
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text('Search',style: TextStyle(
                          color: primaryColor,
                          fontFamily: 'OpenSansSemi',
                          fontSize: 20),),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      // body: ,
    );
  }
}
