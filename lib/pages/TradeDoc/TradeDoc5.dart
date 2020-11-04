import 'dart:async';
import 'package:blocktrad/pages/Dashboard.dart';
import 'package:http/http.dart' as http;
import 'package:blocktrad/konstants/API.dart';
import 'package:blocktrad/konstants/color.dart';
import 'package:currency_pickers/country.dart';
import 'package:currency_pickers/currency_picker_dropdown.dart';
import 'package:currency_pickers/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class TradeDoc5 extends StatefulWidget {

  String cUname;
  String paymentType;
  String credPeriod;
  String incoterms;
  String invoiceDate;

  TradeDoc5({this.cUname,this.credPeriod='0',this.paymentType,this.incoterms,this.invoiceDate});



  @override
  _TradeDoc5State createState() => _TradeDoc5State();
}

class _TradeDoc5State extends State<TradeDoc5> {


  String curr;
  String amt;
  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();
  final storage=FlutterSecureStorage();


  void _doSomething() async {
      final String url=tradeUrl;
      String accToken=await storage.read(key: 'accToken');
      Map<String,String>header={
        "token":"$accToken",
        "Content-Type":"application/json"
      };
      String username=await storage.read(key: 'username');
      String body='{"inco":"${widget.incoterms}","amount":"${curr+amt}","creditPeriod":"${widget.credPeriod}","expUser":"$username","impUser":"${widget.cUname}","paymentType":"${widget.paymentType}","invoiceDate":"${widget.invoiceDate}"}';
      http.Response response=await http.post(url,headers: header,body: body);
      print(body);
      print(response.body);
      print(response.statusCode);
      if(response.statusCode==200){
      _btnController.success();
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context)=>Dashboard()), (route) => false);
      }else{
        _btnController.error();
      }
  }



  Widget _buildDropdownItem(Country country) => Center(
    child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CurrencyPickerUtils.getDefaultFlagImage(country),
          SizedBox(
            width: 8.0,
          ),
          Text("+${country.currencyCode}(${country.isoCode})"),
        ],
      ),
    ),
  );


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.incoterms);
    print(widget.cUname);
    // print(widget.invoiceDue);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: primaryColor,
        title: Text('Trade Document',style: TextStyle(fontFamily: 'OpenSansSemi',fontSize: 20,color: Colors.white),),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
          onPressed: (){
            Navigator.pop(context);
          },
        ),
      ),
        backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('5',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 20,),),
                          Text('/5',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 15,),),
                        ],
                      ),
                      Text('STEPS',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 12,),)
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Align(child: Text('Amount Details',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 15,),textAlign: TextAlign.start,),alignment: Alignment.centerLeft,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5,top: 12,bottom: 12),
                    child: Row(
                      children: [
                        Text('Currency',style: TextStyle(color: Colors.black,fontFamily: 'OpenSans',fontSize: 15,),),
                        Spacer(),
                        CurrencyPickerDropdown(
                          initialValue: 'in',
                          itemBuilder: _buildDropdownItem,
                          onValuePicked: (Country country) {
                            print("${country.name}");
                            print(country.currencyCode);
                            print(country.currencyName);
                            print(country.iso3Code);
                            print(country.isoCode);
                            setState(() {
                              curr=country.currencyCode;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Adjusted Total',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Freight/ Dev.Amt.',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Packing Charges',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Handling Charges',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Other Charges',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Insurance Amount',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Tax Amount',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: greyColor)
              //     ),
              //     child: TextFormField(
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(
              //             left: 10, top: 5),
              //         border: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         errorBorder: InputBorder.none,
              //         disabledBorder: InputBorder.none,
              //         labelText: 'Trade Total ',
              //         labelStyle: TextStyle(
              //             color: Colors.black, fontFamily: 'OpenSans'),
              //       ),
              //       style: TextStyle(
              //           color: Colors.black,
              //           fontFamily: 'OpenSans',
              //           fontSize: 14
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Pre Tax Amount',
                      labelStyle: TextStyle(
                          color: greyColor, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        amt=val;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Trade Total ',
                      labelStyle: TextStyle(
                          color: Colors.black, fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,top: 10,left: 50,right: 50),
                child: Align(
                  alignment: Alignment.center,
                  // child: InkWell(
                  //   onTap: ()async{
                  //     Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc5()));
                  //   },
                  //   child: Material(
                  //     borderRadius: BorderRadius.circular(7),
                  //     shadowColor: Color(0x40000000),
                  //     child: Container(
                  //       decoration: BoxDecoration(
                  //         boxShadow: [
                  //           BoxShadow(color: Color(0x40000000),blurRadius: 4)
                  //         ],
                  //         color: buttonColor,
                  //         borderRadius: BorderRadius.circular(7),
                  //       ),
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                  //         child: Text('Finish',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20),),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  child: RoundedLoadingButton(
                    color: buttonColor,
                    child: Text('Finish', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20)),
                    controller: _btnController,
                    onPressed: _doSomething,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
