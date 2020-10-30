import 'package:blocktrad/konstants/color.dart';
import 'package:flutter/material.dart';
import 'package:currency_pickers/currency_pickers.dart';
import 'TradeDoc3.dart';
import 'package:currency_pickers/country.dart';
class TradeDoc2 extends StatefulWidget {
  @override
  _TradeDoc2State createState() => _TradeDoc2State();
}

class _TradeDoc2State extends State<TradeDoc2> {


  String datpvalue;
  String paymentValue;
  String incotermValue;


  Widget _buildDropdownItem(Country country) => Container(
    child: Row(
      children: <Widget>[
        CurrencyPickerUtils.getDefaultFlagImage(country),
        SizedBox(
          width: 8.0,
        ),
        Text("+${country.currencyCode}(${country.isoCode})"),
      ],
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                          Text('2',style: TextStyle(color: greyColor,fontFamily: 'OpenSansSemi',fontSize: 20,),),
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
                child: Align(child: Text('Receiver/Consignee Information',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 15,),textAlign: TextAlign.start,),alignment: Alignment.centerLeft,),
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
                      labelText: 'Receiver Firm',
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
                    maxLines: 3,
                    decoration: InputDecoration(
                      // helperMaxLines: 3,
                      contentPadding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      hintText: 'Receiver address',
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
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 10,top: 5),
                      border: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      disabledBorder: InputBorder.none,
                      labelText: 'Receiver Contact Name',
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
                      labelText: 'Receiver Telephone Number',
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
                      labelText: 'Receiver Email',
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
                    child: DropdownButtonFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 14
                      ),
                      onChanged: (val){
                        setState(() {
                          datpvalue=val;
                        });
                      },
                      value: datpvalue,
                      items: [
                        DropdownMenuItem(child: Text('Exporter'),value: 'Exporter',),
                        DropdownMenuItem(child: Text('Importer'),value: 'Importer',),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: 'Duty and Taxes Payable by',
                        labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                      ),
                    )
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
                          child: DropdownButtonFormField(
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'OpenSans',
                                fontSize: 14
                            ),
                            onChanged: (val){
                              setState(() {
                                paymentValue=val;
                              });
                            },
                            value: paymentValue,
                            items: [
                              DropdownMenuItem(child: Text('Advanced Tokens'),value: 'Advanced Tokens',),
                              DropdownMenuItem(child: Text('Assets'),value: 'Assets',),
                            ],
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 10,top: 5),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              labelText: 'Payment Method',
                              labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans',fontSize: 12),
                            ),
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
                        child: Padding(
                          padding: const EdgeInsets.only(left: 5,top: 12,bottom: 12),
                          child: CurrencyPickerDropdown(
                            initialValue: 'in',
                            itemBuilder: _buildDropdownItem,
                            onValuePicked: (Country country) {
                              print("${country.name}");
                            },
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
                    child: DropdownButtonFormField(
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'OpenSans',
                          fontSize: 14
                      ),
                      onChanged: (val){
                        setState(() {
                          incotermValue=val;
                        });
                      },
                      value: incotermValue,
                      items: [
                        DropdownMenuItem(child: Text('EXW-EX WORKS'),value: 'EXW',),
                        DropdownMenuItem(child: Text('FCA-FREE CARRIER'),value: 'FCA',),
                        DropdownMenuItem(child: Text('FAS-FREE ALONGSIDE SHIP'),value: 'FAS',),
                        DropdownMenuItem(child: Text('FOB-FREE ON BOARD'),value: 'FOB',),
                        DropdownMenuItem(child: Text('CFR-COST AND FREIGHT'),value: 'CFR',),
                        DropdownMenuItem(child: Text('COST, INSURANCE AND FREIGHT'),value: 'CIF',),
                        DropdownMenuItem(child: Text('CARRIAGE PAID TO'),value: 'CPT',),
                        DropdownMenuItem(child: Text('CIP-CARRIAGE AND INSURANCE PAID TO'),value: 'CIP',),
                        DropdownMenuItem(child: Text('DAF - DELIVERED AT FRONTIER'),value: 'DAF',),
                        DropdownMenuItem(child: Text('DES-DELIVERED EX SHIP'),value: 'DES',),
                        DropdownMenuItem(child: Text('DEQ-DELIVERED EX QUAY (DUTY PAID)'),value: 'DEQ',),
                        DropdownMenuItem(child: Text('DDU-DELIVERED DUTY UNPAID'),value: 'DDU',),
                        DropdownMenuItem(child: Text('DDP-DELIVERED Duty PAID'),value: 'DDP',),
                      ],
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10,top: 5),
                        border: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        labelText: 'Delivery Terms (Incoterms):',
                        labelStyle: TextStyle(color: greyColor,fontFamily: 'OpenSans'),
                      ),
                    )
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: InkWell(
                    onTap: ()async{
                      Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>TradeDoc3()));
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
