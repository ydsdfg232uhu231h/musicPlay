import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: "Email"),
            ),
            SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(labelText: "Password"),
            ),
            SizedBox(height: 25),
            ElevatedButton(
              onPressed: () {
                // Show success message
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Login Successful!"),
                    duration: Duration(seconds: 2),
                    backgroundColor: Colors.green,
                  ),
                );
              },
              child: const Text("Login"),
            ),
          ],
        ),
      ),
    );
  }
}