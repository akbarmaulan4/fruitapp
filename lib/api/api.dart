import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class API{
  static String BASE_URL = 'http://demo6772422.mockable.io/ta/challenges';
  static basePost(
      String module,
      Map<String, dynamic> post,
      Map<String, String> headers,
      bool encode,
      void callback(dynamic, Exception)) async {

    print("URL ${BASE_URL + module}");
    print("POST Header ${json.encode(headers)}");
    print("POST VALUE ${json.encode(post)}");
    var mapError = new   Map();
    try{
      final response = await http.post(Uri.parse(BASE_URL + module),
          // ignore: missing_return
          headers: headers, body: encode ? json.encode(post) : post).timeout(Duration(seconds: 30));
      if(response != null){
        int responseCode = response.statusCode;
        var mapJson = json.decode(response.body);
        var dsasd = json.encode(mapJson);
        print("POST RESULT ${json.encode(mapJson)}");
        if (responseCode == 200) {
          callback(mapJson, null);
        } else if (responseCode == 401 ||
            responseCode == 403 ||
            responseCode == 401 ||
            responseCode == 403) {
          callback(null, mapJson);
        } else {
          callback(null, mapJson);
        }
      }else{
        mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
        callback(null, mapError);
      }
    } on SocketException catch(e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    } catch (e){
      mapError.putIfAbsent('message', () => 'Koneksi sedang tidak stabil');
      callback(null, mapError);
    }
  }
}