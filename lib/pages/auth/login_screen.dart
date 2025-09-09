import 'package:bite_box/pages/Home/home_screen.dart';
import 'package:bite_box/pages/auth/signup_screen.dart';
import 'package:bite_box/service/auth_service.dart';
import 'package:bite_box/widgets/my_button.dart';
import 'package:bite_box/widgets/snackbar.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  //login method

  final AuthService _authService = AuthService();
  bool isLoading = false;
  bool isPasswordHidden = true;

  // void _login() async {
  //   //validate email format
  //   String email = emailController.text.trim();
  //   String password = passwordController.text.trim();
  //   if (!mounted) return;
  //   setState(() {
  //     isLoading = true;
  //   });
  //   try {
  //     await _authService.login(email, password);
  //     // success case
  //     showSnackbar(context, 'successfully login!');
  //     setState(() {
  //       isLoading = false;
  //     });
  //     Navigator.pushReplacement(
  //       context,
  //       MaterialPageRoute(builder: (context) => HomeScreen()),
  //     );
  //   } catch (e) {
  //     setState(() {
  //       isLoading = false;
  //     });
  //     showSnackbar(context, 'Signup failed: $e');
  //   }
  // }

  //updated login function

  void _login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (!mounted) return;
    setState(() => isLoading = true);

    try {
      final user = await _authService.login(email, password);

      if (user != null) {
        showSnackbar(context, 'Successfully logged in!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    } catch (e) {
      showSnackbar(context, e.toString()); // show real error
    } finally {
      if (mounted) setState(() => isLoading = false);
    }
  }

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
              'assets/login.jpg',
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
              obscureText: isPasswordHidden,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordHidden ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordHidden = !isPasswordHidden;
                    });
                  },
                ),
                labelText: 'Password',
              ),
            ),

            SizedBox(height: 20),

            SizedBox(
              width: double.maxFinite,
              child: isLoading
                  ? CircularProgressIndicator()
                  : MyButton(onTap: _login, buttonText: 'Login'),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: TextStyle(fontSize: 18),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignupScreen()),
                    );
                  },
                  child: Text(
                    'Signup Here',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      letterSpacing: -1,
                      //here this letterspacing keep less space between two letter
                    ),
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
