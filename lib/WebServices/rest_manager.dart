import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../Models/get_orders_response.dart';

class RestManager {
  //Calling API with .env file
  static var baseUrl = dotenv.env['API_URL'] ?? 'API URL NOT FOUND';
  static final _headers = {
    'Content-Type': 'application/json; charset=UTF-8',
    'auth-token': '1234567890',
  };

  static final _getOrders = '$baseUrl/api/Orders/ListOfProduct';

  // getOrders *************************************************************

  static Future<ListOforders> getOrders() async {
    try {
      final response = await http.get(
        Uri.parse(_getOrders),
        headers: _headers,
      );
      var error = 'Failed to call \'ListOfProduct\'';

      if (response.statusCode == 200) {
        // ignore: avoid_print
        print(response.body);

        final r = ListOforders.fromJson(jsonDecode(response.body));

        if (r.code == '-1') {
          if (r.message != null && r.message!.isNotEmpty) {
            error = r.message!;
          }
        } else {
          return r;
        }
      }
      throw error;
    } catch (e) {
      rethrow;
    }
  }
}
