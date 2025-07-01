import 'package:flutter/material.dart';
import '../../services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color orangeColor = const Color(0xFFE95B2A);
  final Color darkColor = const Color(0xFF212121);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password tidak boleh kosong")),
      );
      return;
    } else {
      loginAuth(context, email, password);
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: orangeColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Spacer(flex: 1),
              Image.asset(
                'assets/images/welcome_illustration.png',
                height: 270,
              ),
              const SizedBox(height: 20),
              const Text(
                'Smart Management for Sprinters\nEfficiently manage deliveries, routes,\nand courier activities in real time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(179, 255, 255, 255),
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 25),

              // TextField Email
              TextField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
              ),
              const SizedBox(height: 10),

              // TextField Password
              TextField(
                controller: passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: handleLogin,
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkColor,
                  padding: const EdgeInsets.all(20),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const Spacer(),
              const Text(
                'Version 1.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
