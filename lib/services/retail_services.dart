import 'dart:convert';

import 'package:retail_app/models/retail_model.dart';
import 'package:http/http.dart' as http;

class RetailServices {
  static const BASE_URL = 'https://api.timbu.cloud/products';
  final String apiKey;
  final String appId;
  final String organizationId;

  RetailServices(
      {required this.apiKey,
      required this.appId,
      required this.organizationId});
  Future<Retail> getRetail() async {
    final response = await http.get(Uri.parse(
        '$BASE_URL?organization_id=$organizationId&Appid=$appId&Apikey=$apiKey'));
    //print("response: ${response.body}");
    if (response.statusCode == 200) {
      return Retail.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to get retail products');
    }
  }
}

//https://api.timbu.cloud/products?organization_id=72f5394fba944b46ba189d89ad0ded36&APP_ID=L3H8EEJZDG7X3MF&API_KEY=2340030005154108b0b037ecb54c31b720240705123255632211
//https://api.timbu.cloud/products?organization_id=72f5394fba944b46ba189d89ad0ded36&Appid=L3H8EEJZDG7X3MF&Apikey=2340030005154108b0b037ecb54c31b720240705123255632211
//$BASE_URL?q=$cityName&appid=$apiKey&units=metric
//$BASE_URL?organization_id=$organizationId&APP_ID=$appiD&API_KEY=$apiKey
//"$baseUrl?organization_id=$organizationId&Appid=$apiId&Apikey=$apiKey"