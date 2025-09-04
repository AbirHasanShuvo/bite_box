import 'package:bite_box/pages/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supabase = Supabase.instance.client;
  //sign up function

  Future<void> signup(String email, String password) async {
    try {
      final response = await supabase.auth.signUp(
        password: password,
        email: email,
      );
      if (response.user != null) {
        return null;
      }
      print("an unknown error occurred");
    } on AuthException catch (e) {
      print("Auth error $e");
    } catch (e) {
      print("Error $e");
    }
  }

  //login function
  Future<void> login(String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        password: password,
        email: email,
      );
      if (response.user != null) {
        return null;
      }
      print("Invalid username or password");
    } on AuthException catch (e) {
      print("Auth error $e");
    } catch (e) {
      print("Error $e");
    }
  }

  //logout function
  Future<void> logout(BuildContext context) async {
    try {
      supabase.auth.signOut();
      if (!context.mounted) return;
      Navigator.of(
        context,
      ).pushReplacement(MaterialPageRoute(builder: (context) => LoginScreen()));
    } catch (e) {
      print('Error $e');
    }
  }
}
