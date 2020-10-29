import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/KycScreen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:blocktrad/konstants/API.dart';

class CompanyInfo extends StatefulWidget {
  @override
  _CompanyInfoState createState() => _CompanyInfoState();
}

class _CompanyInfoState extends State<CompanyInfo> {

  String companyName;
  String companyAddress;
  String companyEmail;
  String companyTelNo;
  String city;
  String country;
  final storage=FlutterSecureStorage();


  makeRequest()async{
    String params = '{"companyName":"$companyName","companyAddress":"$companyAddress","companyEmail":"$companyEmail","companyTelNo":"$companyTelNo","city":"$city","country":"$country"}';
    String accToken=await storage.read(key: 'accToken');
    http.Response response = await http.post(companyInfoUrl, headers: {
      "Content-Type": "application/json",
      "token":accToken
    },
        body: params);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: 'Company Information Added',backgroundColor: Colors.black,textColor: Colors.white);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>KycScreen()));
    }else{
      Fluttertoast.showToast(msg: 'Something went wrong',backgroundColor: Colors.black,textColor: Colors.white);
    }
//    final newURI = uri.replace(queryParameters: params);
//    Uri,Uri.https(authority, unencodedPath)
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png'),
              Text('Company Info',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 24),),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        companyName=val;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Company Name',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        companyEmail=val;
                      });
                    },
                    style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Company Email',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                    onChanged: (val){
                      setState(() {
                        companyAddress=val;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Company Addr.',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                    onChanged: (val){
                      setState(() {
                        companyTelNo=val;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Tel No.',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                    onChanged: (val){
                      setState(() {
                        city=val;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'City',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color:primaryColor
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(7)),
                  ),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                    onChanged: (val){
                      setState(() {
                        country=val;
                      });
                    },
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        border: InputBorder.none,
                        hintText: 'Country',
                        hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: ()async{
                    await makeRequest();
                  },
                  child: Material(
                    borderRadius: BorderRadius.circular(7),
                    shadowColor: Color(0x40000000),
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(color: Color(0x40000000),blurRadius: 4)
                        ],
                        color: buttonColor,
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40,vertical: 10),
                        child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20),),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
            ],
          ),
        ),
      ),
    );
  }
}
