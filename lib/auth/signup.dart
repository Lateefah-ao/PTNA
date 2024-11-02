import 'package:flutter/material.dart';
import 'package:public_transport_navigator/auth/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool _isPasswordVisible = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 100), // Extra top space
              const Text(
                "Create an Account",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),

              // Name Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Name cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Email Field
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Enter email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Email cannot be empty";
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}')
                      .hasMatch(value)) {
                    return "Please enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password Field
              TextFormField(
                obscureText: !_isPasswordVisible,
                decoration: InputDecoration(
                  labelText: "Enter password",
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPasswordVisible = !_isPasswordVisible;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Password cannot be empty";
                  }
                  if (value.length < 6) {
                    return "Password should be at least 6 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 40),

              // Signup Button
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Sign-up logic here
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Signing Up...')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding:
                      const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Login()));
                  },
                  child: const Text("Already have an account?"))
            ],
          ),
        ),
      ),
    );
  }
}
