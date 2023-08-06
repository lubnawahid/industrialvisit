import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  final String url = "https://840a-2401-4900-647e-98a0-edbd-2f98-abc6-757f.ngrok-free.app";

  authData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
      body: data,
    );
  }
  postData( apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.post(
      Uri.parse(fullUrl),
    );
  }
  putData(data, apiUrl) async {
    var fullUrl = url + apiUrl;
    return await http.put(
      Uri.parse(fullUrl),
      body: data,
    );
  }
  getData(apiUrl) async {
    var fullUrl = url + apiUrl;
    // await _getToken();
    return await http.get(Uri.parse(fullUrl),
      // headers: _setHeaders()
    );
  }
  deleteData(apiUrl)async{
    var fullUrl = url + apiUrl;
    return await http.delete(
      Uri.parse(fullUrl),
    );
  }
}