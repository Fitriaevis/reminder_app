import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Ensure you have this import
import 'package:suplis_app/database/database_helper.dart';
import 'package:suplis_app/models/user_model.dart';

class AuthService {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // Register a new user
  Future<bool> register(String username, String email, String password) async {
    try {
      final existingUser = await _dbHelper.getUserByEmail(email);
      if (existingUser != null) {
        return false; // Email already exists
      }
      final user = User(username: username, email: email, password: password);
      await _dbHelper.insertUser(user.toMap());
      return true;
    } catch (e) {
      // Handle exceptions here
      print("Error during registration: $e");
      return false;
    }
  }

  // Login a user
  Future<bool> login(String email, String password) async {
    try {
      final user = await _dbHelper.getUserByEmail(email);
      if (user != null && user['password'] == password) {
        // Save session or token if needed
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('user_email', email); // Save user session
        return true; // Successful login
      }
      return false; // Failed login
    } catch (e) {
      // Handle exceptions here
      print("Error during login: $e");
      return false;
    }
  }

  // Logout the user
  Future<void> logout() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove('user_email'); // Clear session data
      // Additional cleanup if needed
    } catch (e) {
      // Handle exceptions here
      print("Error during logout: $e");
    }
  }

  // Check if the user is logged in
  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    final email = prefs.getString('user_email');
    return email != null;
  }
}
