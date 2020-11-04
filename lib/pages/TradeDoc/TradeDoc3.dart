import 'package:blocktrad/konstants/color.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:currency_pickers/currency_pickers.dart';

import 'TradeDoc4.dart';

class TradeDoc3 extends StatefulWidget {

  String cUname;
  String paymentType;
  String credPeriod;
  String incoterms;
  String invoiceDate;
  TradeDoc3({this.cUname,this.credPeriod,this.paymentType,this.incoterms,this.invoiceDate});

  @override
  _TradeDoc3State createState() => _TradeDoc3State();
}

class _TradeDoc3State extends State<TradeDoc3> {





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
                          Text('3',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 20,),),
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
                child: Align(child: Text('Logistic Details',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 15,),textAlign: TextAlign.start,),alignment: Alignment.centerLeft,),
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
                      labelText: 'Place of Collection',
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
                          child: DateTimeField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,top: 5),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: 'Collection Date',
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
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: greyColor)
                          ),
                          child:DateTimeField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,top: 5),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: 'Collection Time',
                              labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans',fontSize: 14),
                            ),
                            format: DateFormat("HH:mm"),
                            onShowPicker: (context, currentValue) async {
                              final time = await showTimePicker(
                                context: context,
                                initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                              );
                              return DateTimeField.convert(time);
                            },
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
                      labelText: 'Place of Discharge',
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
                          child: DateTimeField(
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,top: 5),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: 'Departure Date',
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
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: greyColor)
                        ),
                        child:DateTimeField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Departure Time',
                            labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans',fontSize: 14),
                          ),
                          format: DateFormat("HH:mm"),
                          onShowPicker: (context, currentValue) async {
                            final time = await showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                            );
                            return DateTimeField.convert(time);
                          },
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
                      labelText: 'Place of Delivery',
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
                      labelText: 'Shipping Marks',
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
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc4(incoterms: widget.incoterms,paymentType: widget.paymentType,cUname: widget.cUname,credPeriod: widget.credPeriod,invoiceDate: widget.invoiceDate,)));
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
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
