import 'package:blocktrad/konstants/color.dart';
import 'package:flutter/material.dart';

import 'login.dart';

class EmailSent extends StatefulWidget {
  String email;
  EmailSent({this.email});

  @override
  _EmailSentState createState() => _EmailSentState();
}

class _EmailSentState extends State<EmailSent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Align(
              alignment: Alignment.topLeft,
              child: IconButton(icon: Icon(Icons.keyboard_arrow_left,color: primaryColor,), onPressed:(){
                Navigator.pop(context);
              }),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/email.jpg'),
                 SizedBox(height: 20,),
                Text('We sent a confirmation email to:',style:  TextStyle(fontSize: 14,fontFamily: 'OpenSans',color: Colors.grey.shade500),),
                SizedBox(height: 10,),
                Text(widget.email,style:   TextStyle(fontSize: 16,fontFamily: 'OpenSans',fontWeight: FontWeight.bold,color: Colors.black)),
                SizedBox(height: 10,),
                Text('Check your email and click on the\nconfirmation link to continue',style:  TextStyle(fontSize: 14,fontFamily: 'OpenSans',color: Colors.grey.shade500),textAlign: TextAlign.center,),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: Column(
              children: [
                GestureDetector(child: Text('Login',style:  TextStyle(fontSize: 14,fontFamily: 'OpenSans',color: primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),onTap: (){Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Login()), (route) => false);
                },),
                SizedBox(height: 20,),
                GestureDetector(child: Text('Resend email',style:  TextStyle(fontSize: 14,fontFamily: 'OpenSans',color: primaryColor,fontWeight: FontWeight.bold),textAlign: TextAlign.center,)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
