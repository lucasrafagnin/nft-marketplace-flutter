import 'package:dio/dio.dart';

class ApiService {
  static const _apiKey = "0a8dc216-2f59-4165-937a-7476993b2fff";
  static const baseUrl = 'https://data-api.nftgo.io';

  Dio getHttpClient() {
    return Dio(BaseOptions(headers: {
      "X-API-KEY": _apiKey,
    }));
  }
}
