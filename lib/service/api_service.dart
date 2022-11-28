import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiService {
  static const baseUrl = 'https://data-api.nftgo.io';

  Dio getHttpClient() {
    return Dio(BaseOptions(headers: {
      "X-API-KEY": getApiKey(),
    }));
  }

  String? getApiKey() => dotenv.env["API_KEY"];
}
