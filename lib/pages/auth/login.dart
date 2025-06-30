import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color orangeColor = Color(0xFFE95B2A);
    const Color darkColor = Color(0xFF212121);

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
                height: 270, // Sesuaikan ukuran sesuai kebutuhan
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
              // const Spacer(flex: 2),
              const SizedBox(height: 20),
              TextField(
                // controller: controller,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    color: const Color.fromARGB(255, 99, 99, 99),
                  ),
                ),
              ),
              SizedBox(height: 25),
              TextField(
                // controller: controller,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(20),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Password',
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: darkColor,
                  padding: const EdgeInsets.all(20),
                  foregroundColor: const Color.fromARGB(255, 255, 255, 255),
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
              const SizedBox(height: 20), // Padding bawah
            ],
          ),
        ),
      ),
    );
  }
}
