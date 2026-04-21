import 'package:home_work/screens/assignment-1/register.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  const Authenticate({super.key});

  @override
  State<Authenticate> createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
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
                      decoration: InputDecoration(
                        labelText: 'អ៊ីមែល',
                        errorStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        border: OutlineInputBorder(),
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
                      decoration: InputDecoration(
                        labelText: 'ពាក្យសម្ងាត់',
                        errorStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                        border: OutlineInputBorder(),
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
                      'ចូលគណនី',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontFamily: 'Khmer Battambang',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'មិនទាន់មានគណនី? ',
                        style: TextStyle(fontFamily: 'Khmer Battambang'),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Navigate to registration screen (to be implemented)
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Register()),
                          );
                        },
                        child: Text(
                          'ចុះឈ្មោះ',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Khmer Battambang',
                          ),
                        ),
                      ),
                    ],
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
