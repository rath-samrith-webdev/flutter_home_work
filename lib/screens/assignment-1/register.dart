import 'package:home_work/screens/assignment-1/otp.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _obscurePassword = true;
  Widget _buildSuffixIcon(String inputType) {
    switch (inputType) {
      case 'username':
        return Icon(
          _usernameController.text.isEmpty ? Icons.error : Icons.check_circle,
          color: _usernameController.text.isEmpty ? Colors.red : Colors.green,
        );
      case 'email':
        return Icon(
          _emailController.text.isEmpty ? Icons.error : Icons.check_circle,
          color: _emailController.text.isEmpty ? Colors.red : Colors.green,
        );
      case 'password':
      default:
        if (_passwordController.text.isEmpty) {
          return IconButton(
            icon: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
            onPressed: () =>
                setState(() => _obscurePassword = !_obscurePassword),
          );
        }
        if (_passwordController.text.length < 6) {
          return Icon(Icons.error, color: Colors.red);
        }
    }

    return Icon(Icons.check_circle, color: Colors.green);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(height: 50), // Add some space at the top
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                      width: 200,
                      height: 200,
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        labelText: 'ឈ្មោះអ្នកប្រើ',
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person, color: Colors.blue),
                        suffixIcon: _buildSuffixIcon('username'),
                        errorStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                      ),
                      controller: _usernameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលឈ្មោះអ្នកប្រើ';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        labelText: 'អ៊ីមែល',
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.email, color: Colors.blue),
                        suffixIcon: _buildSuffixIcon('email'),
                        errorStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                      ),
                      controller: _emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលអ៊ីមែល';
                        }
                        if (!RegExp(
                          r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'អ៊ីមែលមិនត្រឹមត្រូវ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 15),
                    TextFormField(
                      obscureText: true,
                      controller: _passwordController,
                      onChanged: (_) => setState(() {}),
                      decoration: InputDecoration(
                        labelText: 'ពាក្យសម្ងាត់',
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        border: OutlineInputBorder(),
                        errorStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        prefixIcon: Icon(Icons.lock, color: Colors.blue),
                        suffixIcon: _buildSuffixIcon('password'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលពាក្យសម្ងាត់';
                        }
                        if (value.length < 6) {
                          return 'ពាក្យសម្ងាត់យ៉ាងតិច ៦ តួអក្សរ';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Perform login action (to be implemented)
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Otp()),
                        );
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.blue),
                      padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(borderRadius: BorderRadius.zero),
                      ),
                    ),
                    child: Text(
                      'បង្កើតគណនី',
                      style: TextStyle(fontSize: 18, color: Colors.white,fontFamily: 'Khmer Battambang'),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
