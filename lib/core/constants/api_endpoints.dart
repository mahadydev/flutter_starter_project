import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiEndpoints {
  static final String baseUrl = dotenv.env['API_BASE_URL'] ?? '';

  // Add more endpoints as needed
}
