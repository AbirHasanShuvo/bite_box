import 'package:bite_box/service/auth_service.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Scaffold(
      appBar: AppBar(title: Text('This is Home Screen')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              authService.logout(context);
            },
            child: Text('Logout'),
          ),
        ],
      ),
    );
  }
}
