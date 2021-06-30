import 'package:mercury_client/mercury_client.dart';

class HellowAPI {

  final String apiUrl;
  final Map<String,String> otherParameters = {};

  HellowAPI({this.apiUrl = 'https://api.binance.com/api/v3/'});

  Future<HttpResponse> doHellowRequest(String method, String requestPath, [Map<String,String>? parameters, dynamic body]
      ) async {

    var client = HttpClient(apiUrl)
      ..requestHeadersBuilder = (clt, url) => {
      }
    ;

    var response = await client.request(getHttpMethod(method)!, requestPath, parameters: parameters);
    return response;
  }


  Future<String?> getAvgPrice() async {
    otherParameters.addAll({'symbol': 'LTCBTC'});

    var response = await doHellowRequest('GET', 'avgPrice', otherParameters);
    if (response.isNotOK || !response.isBodyTypeJSON) return null;

    var json = response.json ;
    var accountType = json['accountType'];

    return response.bodyAsString;
  }



}
