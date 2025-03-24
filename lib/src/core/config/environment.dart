import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Environment {
  static String get fileName => 'dotenv';

  static String get devBaseUrl => dotenv.env['DEV_BASE_URL'] ?? 'Dev Base URL not found!';

  static String get prodBaseUrl => dotenv.env['PROD_BASE_URL'] ?? 'Prod Base URL not found!';
}
