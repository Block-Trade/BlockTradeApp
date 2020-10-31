import 'dart:async';

import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/pages/TradeDoc/TradeDoc2.dart';
import 'package:flutter/material.dart';
import 'package:date_range_picker/date_range_picker.dart' as DateRagePicker;
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:intl/intl.dart';

class TradeDoc1 extends StatefulWidget {

  String cUname;
  TradeDoc1({this.cUname});

  @override
  _TradeDoc1State createState() => _TradeDoc1State();
}

class _TradeDoc1State extends State<TradeDoc1> {

  TextEditingController _controller=TextEditingController();
  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();
  String paymentType;
  String credPeriod;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  void _doSomething() async {
    Timer(Duration(seconds: 3), () {
      _btnController.success();
    });
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
                          Text('1',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 20,),),
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
                child: Align(child: Text('Seller Information',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 15,),textAlign: TextAlign.start,),alignment: Alignment.centerLeft,),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: greyColor)
                ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Seller Firm',
                      labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'OpenSans',
                      fontSize: 14
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyColor)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Invoice Number',
                            labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 14
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyColor)
                        ),
                        child: DateTimeField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Invoice Date',
                            labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans',fontSize: 14),
                          ),
                          format: DateFormat("yyyy-MM-dd"),
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        )
                      ),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(5),
              //         border: Border.all(color: greyColor)
              //     ),
              //     child: DateTimeField(
              //       onChanged: (val){
              //         setState(() {
              //           invoiceDue=val;
              //         });
              //       },
              //       decoration: InputDecoration(
              //         contentPadding: EdgeInsets.only(left: 10,top: 5),
              //         border: InputBorder.none,
              //         focusedBorder: InputBorder.none,
              //         enabledBorder: InputBorder.none,
              //         errorBorder: InputBorder.none,
              //         disabledBorder: InputBorder.none,
              //         labelText: 'Invoice Due',
              //         labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans',fontSize: 14),
              //       ),
              //       format: DateFormat("yyyy-MM-dd"),
              //       onShowPicker: (context, currentValue) {
              //         return showDatePicker(
              //             context: context,
              //             firstDate: DateTime(1900),
              //             initialDate: currentValue ?? DateTime.now(),
              //             lastDate: DateTime(2100));
              //       },
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
                    maxLines: 3,
                    decoration: InputDecoration(
                      // helperMaxLines: 3,
                      contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Seller address',
                      // labelText: 'Seller address',
                      hintStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
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
                    child: DropdownButtonFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 14
                      ),
                      onChanged: (val){
                        setState(() {
                          paymentType=val;
                        });
                      },
                      value: paymentType,
                      items: [
                        DropdownMenuItem(child: Text('PA'),value: 'PA',),
                        DropdownMenuItem(child: Text('PL'),value: 'PL',),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: 'Payment Type',
                        labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                      ),
                    )
                ),
              ),
              paymentType=='PA'?Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    onChanged: (val){
                      setState(() {
                        credPeriod=val;
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Credit Period(in days)',
                      labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ):Container(),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyColor)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Purpose of shipment',
                            labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 14
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyColor)
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Parties To Transactions',
                            labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                          ),
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'OpenSans',
                              fontSize: 12
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: greyColor)
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Seller Contact Name',
                      labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
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
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Seller Telephone Number',
                      labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
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
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Seller Email',
                      labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                    ),
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10,right: 40,left: 40),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc2(paymentType: paymentType,cUname: widget.cUname,credPeriod: credPeriod,)));
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
                          padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                          child: Text('Next',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontFamily: 'OpenSans',fontSize: 20),),
                        ),
                      ),
                    ),
                  ),
                  // child: RoundedLoadingButton(
                  //   color: buttonColor,
                  //   child: Text('Save', style: TextStyle(color: Colors.white)),
                  //   controller: _btnController,
                  //   onPressed: _doSomething,
                  // ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
