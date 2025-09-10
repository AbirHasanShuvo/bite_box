import 'package:bite_box/pages/screen/home_screen.dart';
import 'package:bite_box/pages/auth/login_screen.dart';
import 'package:bite_box/pages/screen/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //supabase like firebase so i need to initialize it first
  await Supabase.initialize(
    url: 'https://xcmxukgmrqkfmnjnwplt.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InhjbXh1a2dtcnFrZm1uam53cGx0Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NTY5NjAzNTgsImV4cCI6MjA3MjUzNjM1OH0.V-GRB8tQLtqMcXJWzGJE3LIu0DNeX-FqhqSyJt_B1WU',
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: AuthCheck());
  }
}

class AuthCheck extends StatelessWidget {
  final supabase = Supabase.instance.client;
  AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: supabase.auth.onAuthStateChange,
      builder: (context, snapshot) {
        final session = supabase.auth.currentSession;
        if (session != null) {
          return OnboardingScreen();
        } else {
          return LoginScreen();
        }
      },
    );
  }
}
