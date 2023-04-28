import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// The root widget. It contains the login form at the center of the screen.
class MyApp extends StatelessWidget {
  /// Creates a [MyApp] widget.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: LoginForm(),
        ),
      ),
    );
  }
}

/// This widget has a login form at the center of the screen.
class LoginForm extends StatefulWidget {
  /// Creates a [LoginForm] widget.
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String? emailValidator(String? value) {
    if (value == null || !value.contains('@gmail.com')) {
      return 'Invalid email!';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Enter some text!';
    }
    return null;
  }

  void formSubmit() {
    if (formKey.currentState?.validate() ?? false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Logged in!')),
      );
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
    return SizedBox(
      width: 200,
      child: Form(
        key: formKey, // Use the form key here!
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: emailController,
              validator: passwordValidator,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              validator: passwordValidator,
              obscureText: true,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: formSubmit,
              child: const Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}
