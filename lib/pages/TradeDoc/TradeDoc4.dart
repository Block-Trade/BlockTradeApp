import 'package:blocktrad/konstants/color.dart';
import 'package:flutter/material.dart';

import 'TradeDoc5.dart';

class TradeDoc4 extends StatefulWidget {

  String cUname;
  String paymentType;
  String credPeriod;
  String incoterms;
  String invoiceDate;
  TradeDoc4({this.cUname,this.credPeriod,this.paymentType,this.incoterms,this.invoiceDate});


  @override
  _TradeDoc4State createState() => _TradeDoc4State();
}

class _TradeDoc4State extends State<TradeDoc4> {
  
  int noOfItems=1;
  
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
                          Text('4',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 20,),),
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
                child: Align(child: Text('Description of Consignment',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 15,),textAlign: TextAlign.start,),alignment: Alignment.centerLeft,),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext contedxt,int pos) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: greyColor)
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 10, top: 5),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: 'Product ID',
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
                                  padding: const EdgeInsets.only(left: 8,right: 8,top: 4,bottom: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(color: greyColor)
                                    ),
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            left: 10, top: 5),
                                        border: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        labelText: 'FX Rate',
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
                              ],
                            ),
                          ),
                          Expanded(
                            child:   Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: greyColor)
                                ),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    hintText: 'Description/Package Kind + Gross/Net/Cube',
                                    hintStyle: TextStyle(
                                        color: greyColor, fontFamily: 'OpenSans'),
                                  ),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'OpenSans',
                                      fontSize: 14
                                  ),
                                  maxLines: 6,
                                ),
                              ),
                            ),
                          ),
                        ],
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10,top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Sell Price',
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Tax %',
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
                          ),
                        ],
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10,top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Item Price',
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Units in Pk.',
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
                          ),
                        ],
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10,top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Quantity',
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
                                    contentPadding: EdgeInsets.only(
                                        left: 10, top: 5),
                                    border: InputBorder.none,
                                    focusedBorder: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                    errorBorder: InputBorder.none,
                                    disabledBorder: InputBorder.none,
                                    labelText: 'Amount',
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
                          ),
                        ],
                      ),
                      Divider(color: primaryColor,thickness: 2,),
                    ],
                  );
                },
                itemCount: noOfItems,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text('Add another Product Details',style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'OpenSans',
                        fontSize: 14
                    ),),
                    Spacer(),
                    IconButton(icon: Icon(Icons.add,color: primaryColor,), onPressed: (){
                      setState(() {
                        noOfItems++;
                      });
                    })
                  ],
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
                      contentPadding: EdgeInsets.only(
                          left: 10, top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Total Amount',
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
                            contentPadding: EdgeInsets.only(
                                left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Total Net Wt.',
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
                            contentPadding: EdgeInsets.only(
                                left: 10, top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Curr Disc.',
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
                  ),
                ],
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
                            contentPadding: EdgeInsets.only(
                                left: 10,top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Total Cube',
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
                            contentPadding: EdgeInsets.only(
                                left: 10, top: 5),
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            labelText: 'Total Gross Wt.',
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
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc5(incoterms: widget.incoterms,paymentType: widget.paymentType,cUname: widget.cUname,credPeriod: widget.credPeriod,invoiceDate: widget.invoiceDate,)));
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
