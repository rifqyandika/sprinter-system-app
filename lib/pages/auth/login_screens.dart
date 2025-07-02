import 'package:flutter/material.dart';
import '../../services/login_service.dart';
import '../../core/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final Color orangeColor = AppColors.secondary;
  final Color darkColor = const Color(0xFF212121);
  bool _isLoading = false;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void handleLogin() async {
    final email = emailController.text.trim();
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Email dan password tidak boleh kosong")),
      );
      setState(() {
        _isLoading = false;
      });
      return;
    } else {
      setState(() {
        _isLoading = true;
      });
      try {
        await loginAuth(context, email, password);
        setState(() {
          _isLoading = false;
        });
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        if (!mounted) return;
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("Login gagal: $e")));
      }
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
                height: 130,
              ),
              const SizedBox(height: 20),
              const Text(
                'Smart Management for Sprinters\nEfficiently manage deliveries, routes,\nand courier activities in real time.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(179, 255, 255, 255),
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 40),

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
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 15),

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
                    borderSide: BorderSide.none,
                  ),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 25),
              _isLoading
                  ? Center(
                      child: LoadingAnimationWidget.staggeredDotsWave(
                        color: Colors.white,
                        size: 50,
                      ),
                    )
                  : ElevatedButton(
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
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
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
