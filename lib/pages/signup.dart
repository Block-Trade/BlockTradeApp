import 'dart:async';

import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/CompanyInfo.dart';
import 'package:blocktrad/pages/emailsent.dart';
import 'package:blocktrad/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../others/animation.dart';
import 'package:country_code_picker/country_code_picker.dart';
class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String name;
  String email;
  String password;
  String username;
  String mobileNo;
  String cc='91';
  String mno;

  makeRequest()async{
    mobileNo=cc+mno;
    String params = '{"name":"${name.trim()}","email":"$email","username":"${username.trim()}","password":"${password.trim()}","mobileNo":"${mobileNo.trim()}"}';
    http.Response response = await http.post(signUpUrl, headers: {
      "Content-Type": "application/json",
    },
    body: params);
    print(params);
    print(signUpUrl);
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      Fluttertoast.showToast(msg: 'New user created',backgroundColor: Colors.black,textColor: Colors.white);
      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>EmailSent(email: email,)));
    }else{
      Fluttertoast.showToast(msg: 'Something went wrong',backgroundColor: Colors.black,textColor: Colors.white);
    }
//    final newURI = uri.replace(queryParameters: params);
//    Uri,Uri.https(authority, unencodedPath)
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomPadding: true,
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                Text('Sign Up',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 24),),
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
                      style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
                      onChanged: (val){
                        setState(() {
                          name=val;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: 'Name',
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
                          email=val;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: 'Email',
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
                          username=val;
                        });
                      },
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,bottom: 10,top: 10),
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
                          password=val;
                        });
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10),
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                  child: Row(
                    children: [
                      CountryCodePicker(
                        onChanged: (val){
                          setState(() {
                            cc=val.code;
                          });
                        },
                        // Initial selection and favorite can be one of code ('IT') OR dial_code('+39')
                        initialSelection: 'IN',
                        favorite: ['+91','FR'],
                        // optional. Shows only country name and flag
                        showCountryOnly: false,
                        // optional. Shows only country name and flag when popup is closed.
                        showOnlyCountryWhenClosed: false,
                        // optional. aligns the flag and the Text left
                        alignLeft: false,
                      ),
                      Expanded(
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
                                mno=val;
                              });
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                contentPadding: EdgeInsets.only(left: 10),
                                border: InputBorder.none,
                                hintText: 'Phone Number',
                                hintStyle: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: ()async{
                      await makeRequest();
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>CompanyInfo()));
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
                          padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
                          child: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20),),
                        ),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Already have an account ?",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 12),),
                      SizedBox(width: 5,),
                      Text("Login",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 12),),
                    ],
                  ),
                ),
                SizedBox(height:20),
              ],
            ),
          ),
        )
    );
  }
}
