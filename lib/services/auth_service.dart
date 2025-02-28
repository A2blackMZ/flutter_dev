import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const String baseURL = "http://127.0.0.1:8000/api";
const String registerURL = "$baseURL/register";
const String confirmURL = "$baseURL/confirm";
const String loginURL = "$baseURL/login";

class AuthService {
  Future<bool> register(String email, String password) async {
    final response = await http.post(
      Uri.parse(registerURL),
      body: {'email': email, 'password': password},
    );
    return response.statusCode == 200;
  }

  Future<bool> confirm(String code) async {
    final response = await http.post(
      Uri.parse(confirmURL),
      body: {'code': code},
    );
    return response.statusCode == 200;
  }
}

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();
  bool _isLoading = false;

  void _register() async {
    setState(() => _isLoading = true);
    bool success = await _authService.register(_emailController.text, _passwordController.text);
    setState(() => _isLoading = false);
    if (success) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ConfirmationScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Échec de l'inscription")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Inscription")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: "Email"),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: "Mot de passe"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            _isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
              onPressed: _register,
              child: Text("S'inscrire"),
            ),
          ],
        ),
      ),
    );
  }
}

class ConfirmationScreen extends StatelessWidget {
  final TextEditingController _codeController = TextEditingController();
  final AuthService _authService = AuthService();

  void _confirm(BuildContext context) async {
    bool success = await _authService.confirm(_codeController.text);
    if (success) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Code invalide")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Confirmation de compte")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _codeController,
              decoration: InputDecoration(labelText: "Code de confirmation"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _confirm(context),
              child: Text("Confirmer"),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Connexion")),
      body: Center(child: Text("Écran de connexion")),
    );
  }
}
