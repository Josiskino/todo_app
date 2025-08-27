import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConstant {
  ApiConstant._();

  static const String host = 'https://apyi.eaddress.org';
  static const String basePath = '/api/v1/';
  static const String baseUrl = '$host$basePath';

  static const String ipGeolocationHost = 'https://api.ipgeolocation.io';
  static const String ipGeolocationBasePath = '/ipgeo';
  static const String ipGeoLocationBaseUrl =
      '$ipGeolocationHost$ipGeolocationBasePath';

  static String get geolocationApiKey =>
      dotenv.env['IP_GEOLOCATION_API_KEY'] ?? '';

  static String get googleApiKey => dotenv.env['GOOGLE_MAPS_API_KEY'] ?? '';
}
