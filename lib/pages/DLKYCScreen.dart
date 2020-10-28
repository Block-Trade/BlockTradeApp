import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/KycVerifiedScreen.dart';
import 'package:flutter/material.dart';

class DLKYCScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: primaryColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Image.asset('assets/images/kyc_verification.png'),
                Text('Hey {Name}\nPlease complete the KYC before moving on',style: TextStyle(fontFamily: 'OpenSansSemi',fontWeight: FontWeight.w400,fontSize: 15,color: Colors.white),),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                  child: InkWell(
                    onTap: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)))
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      shadowColor: Color(0x40000000),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color(0x40000000),blurRadius: 4)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 10),
                          child: TextFormField(
                            textAlign: TextAlign.center,
                            decoration: InputDecoration.collapsed(hintText: 'DL Number',hintStyle: TextStyle(fontFamily: 'OpenSans',fontSize: 15,color: Colors.black),),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50,vertical: 8),
                  child: InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>KycVerifiedScreen()));
                    },
                    child: Material(
                      borderRadius: BorderRadius.circular(7),
                      shadowColor: Color(0x40000000),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(color: Color(0x40000000),blurRadius: 4)
                          ],
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Center(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text('Complete KYC',style: TextStyle(color: primaryColor,fontWeight: FontWeight.bold,fontFamily: 'OpenSansSemi',fontSize: 20),),
                        )),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
