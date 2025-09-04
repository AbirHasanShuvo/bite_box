import 'package:bite_box/widgets/my_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Image.asset(
              height: 500,
              width: double.maxFinite,
              'assets/6343825.jpg',
            ),

            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Email',
              ),
            ),

            SizedBox(height: 20),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(Icons.visibility),
                  onPressed: () {
                    // Toggle password visibility
                  },
                ),
                labelText: 'Password',
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              child: MyButton(onTap: () {}, buttonText: 'Sign Up'),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(fontSize: 18),
                ),
                Text(
                  'Login Here',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -1,
                    //here this letterspacing keep less space between two letter
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
