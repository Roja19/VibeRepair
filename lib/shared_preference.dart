import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  static SharedPreferences? _preferences;

  // Keys for storing data
  static const String _keyUserEmail = "user_email";
  static const String _keyRatingPrefix = "rating_"; // Prefix for ratings

  // Initialize SharedPreferences (Call this in main.dart)
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // 📌 Save User Email
  static Future<void> saveUserEmail(String email) async {
    await _preferences?.setString(_keyUserEmail, email);
  }

  // 📌 Get User Email
  static String? getUserEmail() {
    return _preferences?.getString(_keyUserEmail);
  }

  // 📌 Save Star Rating (per item)
  static Future<void> saveRating(String itemTitle, double rating) async {
    await _preferences?.setDouble("$_keyRatingPrefix$itemTitle", rating);
  }

  // 📌 Get Star Rating (per item)
  static double getRating(String itemTitle) {
    return _preferences?.getDouble("$_keyRatingPrefix$itemTitle") ?? 3.0; // Default 3.0
  }
}
