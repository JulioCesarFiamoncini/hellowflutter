import 'package:flutter/material.dart';
import 'package:hellowflutter/MyDialogs.dart';
import 'package:hellowflutter/HellowAPI.dart';
import 'package:swiss_knife/swiss_knife.dart';
import 'package:hellowflutter/pages/account.pages.dart';
import 'package:async_field/async_field.dart';
// import 'dart:convert' as convert;
// import 'dart:io';



TextEditingController loginController = new TextEditingController();
TextEditingController passwordController = new TextEditingController();

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      appBar: AppBar(

        title: Text("Hellow Word"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                margin: EdgeInsets.all(20),
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: new AssetImage('graphics/logowhite.png'),
                      //image: NetworkImage('https://googleflutter.com/sample_image.jpg'),
                      fit: BoxFit.scaleDown
                  ),
                ),
              ),


              TextFormField(
                  controller: loginController,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Login",
                      labelStyle: TextStyle(color: Colors.white))
              ),

              TextFormField(
                  controller: passwordController,
                  autofocus: false,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white))
              ),

              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: ()  {
                  MyDialogs().showAlertDialog2Button(context,'Cancela','Confirma','Confirma Operação..','Texto Exemplo',testFunc);
                },
                  child: Text(
                    "Entrar", style: TextStyle(color: Colors.blueAccent),
                  ),
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//
//   void testAsyncFiled() async {
// // The fields storage:
//    var storage = AsyncStorage();
//
//    // Get field 'btc_usd',
//    var field = storage.getField<double>('btc_usd')
//      ..defaultValue = double.nan // default value (before fetch).
//      ..withFetcher(_fetchBtcUsd) // the field fetcher.
//      ..onChange.listen((field) => print('onChange> $field')); // change listener.
//
//    print('BTX-USD: $field');
//    print('field.info: ${field.info}');
//
//    // Get the field value:
//    var btcUsd = await field.get();
//
//    print('field.get(): $btcUsd');
//
//    print('BTX-USD: $field');
//    print('field.info: ${field.info}');
//
//  }
//
//   /// Function that fetches the BTS-USD price.
//   Future<double> _fetchBtcUsd(AsyncField<double> field) async {
//     return _getURL('https://api.coindesk.com/v1/bpi/currentprice.json')
//         .resolveMapped((body) {
//       var json = convert.json.decode(body) as Map<String, dynamic>;
//       var rate = json['bpi']['USD']['rate_float'];
//       return double.parse('$rate');
//     });
//   }
//
//   /// Simple HTTP get URL function.
//   Future<String> _getURL(String url) async {
//     var uri = Uri.parse(url);
//     var httpClient = HttpClient();
//
//     var response =
//     await httpClient.getUrl(uri).then((request) => request.close());
//
//     var data = await response.transform(convert.Utf8Decoder()).toList();
//     var body = data.join();
//     return body;
//   }



 bool testFunc () {
    bool _result = false;
    var hellowAPI = HellowAPI();
    hellowAPI.getAvgPrice().then((value){
      setState(() {
        print(value);
        MyDialogs().showAlertDialog(context,'Confirma','Titles..',value!).then((value) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AccountPages()),
            );
        });
        _result = true;


      });
    });
    return _result;
  }




}