
import 'dart:convert';

import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../others/animation.dart';
import 'Dashboard.dart';



class Abc extends StatefulWidget {



  @override
  _AbcState createState() => _AbcState();
}

class _AbcState extends State<Abc> {

  final storage=FlutterSecureStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    chk();
  }

  chk()async{
    bool chk=await storage.containsKey(key: 'accToken');
    if(chk){
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Dashboard()), (route) => false);
    }else{
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Login()), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
    );
  }
}


class Login extends StatefulWidget {


  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username;

  String password;
  bool wrongPasswod=false;
  final storage=FlutterSecureStorage();




  makeRequest()async{
    setState(() {
      wrongPasswod=false;
    });
    print('hi');
    String params = '{"username":"${username.trim() }","password":"${password.trim()}"}';
    http.Response response = await http.post(loginUrl, headers: {
      "Content-Type": "application/json",
    },
        body: params);
   print(response.statusCode);
   print(params);
   print(response.body);
    if(response.statusCode==200){
      String token=jsonDecode(response.body)['token'];

      await storage.write(key: 'accToken', value: token);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Dashboard()), (route) => false);
    }
    else if(response.statusCode==400){
      String msg=jsonDecode(response.body)['msg'];
      Fluttertoast.showToast(msg: msg);
      print('hi1');
      print('hi2');
      print(msg);
      if(msg.contains('valid password')){
        setState(() {
          wrongPasswod=true;
        });
      }
    }

  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset('assets/images/logo.png'),
                Text('Login',style: TextStyle(fontFamily: 'OpenSans',fontWeight: FontWeight.bold,fontSize: 24),),
                Padding(
                  padding: const EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
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
                          username=val;
                        });
                      },
                      style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
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
                  padding: const EdgeInsets.only(left: 40,right: 40,bottom: 20),
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
                          password=val;
                        });
                      },
                      style: TextStyle(fontSize: 14,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black),
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
                          padding: const EdgeInsets.symmetric(horizontal: 70,vertical: 10),
                          child: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20),),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height:10),
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SignUp()));
                  },
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Don't have an account?",style:TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 12),),
                      SizedBox(width: 5,),
                      Text("Sign Up",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 12),),
                    ],
                  ),
                ),
                SizedBox(height:10),
                Text("Forgot Password",style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 12),),

              ],
            ),
          ),
        )
    );
  }
}