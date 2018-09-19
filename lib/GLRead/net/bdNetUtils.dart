import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'dart:io';

class bdNetUtils {
  static void get(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    print("$url");
    try {
      http.Response res = await http.get(Uri.encodeFull(url), headers: {"Accept": "application/json","user-agent":"GLRead"});
      var convertDataToJson = json.decode(res.body);

      if (callback != null) {
        callback(convertDataToJson);
      }
    } catch (exception) {
      if (errorCallback != null) {
        errorCallback(exception);
      }
    }
  }

  static void post(String url, Function callback,
      {Map<String, String> params, Function errorCallback}) async {
    try {
      http.Response res = await http.post(url, body: params,headers: {"Accept": "application/json","user-agent":"GLRead"});
      var convertDataToJson = json.decode(res.body);

      if (callback != null) {
        callback(convertDataToJson);
      }
    } catch (e) {
      if (errorCallback != null) {
        errorCallback(e);
      }
    }
  }

  static Future<String> getFuture(String url, {Map<String, String> params}) async {
    if (params != null && params.isNotEmpty) {
      StringBuffer sb = new StringBuffer("?");
      params.forEach((key, value) {
        sb.write("$key" + "=" + "$value" + "&");
      });
      String paramStr = sb.toString();
      paramStr = paramStr.substring(0, paramStr.length - 1);
      url += paramStr;
    }
    var httpClient = new HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();
    return await response.transform(utf8.decoder).join();
  }
}