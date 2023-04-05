import 'package:http/http.dart' as http ;

class Api{
  final String Url ="http://192.168.1.44:5000/";

  authData (data,apiUrl) async{
    var fullUrl = Url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }
  getData (apiUrl) async{
    var fullUrl = Url + apiUrl;
   return await http.get(Uri.parse(fullUrl),
   );
  }
 /* deleteData(apiUrl)async{
    var fullUrl = Url + apiUrl;
    return await http.get(Uri.parse(fullUrl));

  }*/
  AddData(data,apiUrl)async{
    var fullUrl = Url + apiUrl;
    return await http.post(Uri.parse(fullUrl),
    body:data,
    );
  }
}

