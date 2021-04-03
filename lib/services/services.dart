import 'dart:async';
import 'dart:convert';

import 'package:covid19_trakcing/model/case.dart';
import 'package:http/http.dart';

class Services {
  final String url = 'https://covid-193.p.rapidapi.com/statistics';
  final headers = {
    "x-rapidapi-key": "fbed72c0cfmsh1766759ac62e30fp1406dejsn10838f8d1b32",
    "x-rapidapi-host": "covid-193.p.rapidapi.com"
  };

  Future<List<Case>> getAllPosts() async {
    var response = await get(url, headers: headers)
        .timeout(Duration(seconds: 10), onTimeout: () {
      throw TimeoutException("connection time out try again");
    });
    if (response.statusCode == 200) {
      List jsonresponse = jsonDecode(response.body)['response'];
      return jsonresponse.map((e) => new Case.fromJson(e)).toList();
    } else {
      return null;
    }
  }
}
