import 'package:blocktrad/konstants/color.dart';
import 'package:blocktrad/models/SideNav.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:web3dart/web3dart.dart';
import 'package:http/http.dart';
class MyWallet extends StatefulWidget {
  @override
  _MyWalletState createState() => _MyWalletState();
}

class _MyWalletState extends State<MyWallet> {


  Client httpClient;
  Web3Client ethClient;
  final myAddress="0x5A8ed9980C09857eF9F2f186316457935245702c";
  var myData;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    httpClient=Client();
    ethClient=Web3Client('https://kovan.infura.io/v3/8c9a59272cd54f8884ea7af3ff8a7e16',httpClient);
    getBalance(myAddress);
  }


  Future<DeployedContract>loadContract()async{
    String abi=await rootBundle.loadString("assets/abis/token.json");
    String contractAddress="0x46Baf018e2E6c6BEe36d59560dAF342e70007245";
    final contract=DeployedContract(ContractAbi.fromJson(abi, "Storage"),EthereumAddress.fromHex(contractAddress));
    return contract;
  }

  Future<List<dynamic>>query(String funcName,List<dynamic>args)async{
    final contract=await loadContract();
    final ethFunction=contract.function(funcName);
    final result=await ethClient.call(contract: contract, function: ethFunction, params: args);
    return result;
  }


  getBalance(String target)async{
    EthereumAddress address=EthereumAddress.fromHex(target);
    List<dynamic>result=await query('balanceOf', [address]);
    myData=result[0];
    print(myData);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        // elevation: 0,
        actions: [
          IconButton(
            icon: CircleAvatar(child: Icon(Icons.person,color: primaryColor,),backgroundColor: Colors.white,radius: 12,),
            onPressed: (){},
          )
        ],
        centerTitle: true,
        title: Text('Wallet',style: TextStyle(color: Colors.white,fontFamily: 'OpenSansSemi'),),
        backgroundColor: primaryColor,
      ),
      drawer: SideNavDrawer(a: 3,),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: 20,),
          Center(child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Blockchain Address : 0x0A44fde3099913116566161 64c',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 15),overflow: TextOverflow.ellipsis,),
          )),
          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset('assets/images/bttoken.png'),
              ),
              SizedBox(width: 10,),
              Text('1,453.4763',style: TextStyle(color: Colors.white,fontFamily: 'OpenSans',fontSize: 25),overflow: TextOverflow.ellipsis,),

            ],
          ),
          SizedBox(height: 30,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(7),
                shadowColor: Color(0x26000000),
                child: Container(
                  width: 135,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(7),
                    boxShadow: [
                      BoxShadow(color: Color(0x26000000),blurRadius: 5)
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                    child: Center(child: Text('Withdraw',style: TextStyle(color: Color(0xFFFC7944),fontFamily: 'OpenSans',fontSize: 18),)),
                  ),
                ),
              ),
              Material(
                elevation: 5,
                borderRadius: BorderRadius.circular(7),
                shadowColor: Color(0x26000000),
                child: Container(
                  width: 135,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7),
                      boxShadow: [
                        BoxShadow(color: Color(0x26000000),blurRadius: 5)
                      ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 8),
                    child: Center(child: Text('Add',style: TextStyle(color: Color(0xFF3F9C31),fontFamily: 'OpenSans',fontSize: 18),)),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 30,),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))
              ),
              child: Column(
                children: [
                  SizedBox(height: 20,),  
                  Text('My Transactions',style: TextStyle(color: Colors.black,fontFamily: 'OpenSansSemi',fontSize: 18),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
