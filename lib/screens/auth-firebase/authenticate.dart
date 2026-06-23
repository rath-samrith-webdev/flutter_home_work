import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_service.dart';
import 'register.dart';
import 'homescreen.dart';

class FireBaseAuth extends StatefulWidget {
  const FireBaseAuth({super.key});

  @override
  State<FireBaseAuth> createState() => _FireBaseAuthState();
}

class _FireBaseAuthState extends State<FireBaseAuth> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  bool _isLoading = false;

  Future<void> login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('ចូលគណនីបានជោគជ័យ')));

      // TODO: Navigate to your home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => HomeScreen()),
      );
    } on FirebaseAuthException catch (e) {
      String message;

      switch (e.code) {
        case 'user-not-found':
          message = 'មិនមានគណនីនេះទេ';
          break;
        case 'wrong-password':
          message = 'ពាក្យសម្ងាត់មិនត្រឹមត្រូវ';
          break;
        case 'invalid-email':
          message = 'អ៊ីមែលមិនត្រឹមត្រូវ';
          break;
        case 'invalid-credential':
          message = 'អ៊ីមែល ឬ ពាក្យសម្ងាត់មិនត្រឹមត្រូវ';
          break;
        default:
          message = e.message ?? 'មានបញ្ហាក្នុងការចូលគណនី';
      }

      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(message)));
    } catch (e) {
      if (!context.mounted) return;

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error: $e')));
    }

    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _handleSocialSignIn(Future<UserCredential?> Function() signInMethod) async {
    setState(() {
      _isLoading = true;
    });

    try {
      final userCredential = await signInMethod();
      if (userCredential != null) {
        if (!context.mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('ចូលគណនីបានជោគជ័យ')),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
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
                const SizedBox(height: 50),

                Image.asset(
                  'assets/images/splash.png',
                  width: 200,
                  height: 200,
                ),

                const SizedBox(height: 20),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'អ៊ីមែល',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'សូមបញ្ចូលអ៊ីមែល';
                        }

                        if (!RegExp(
                          r'^[\w\-.]+@([\w\-]+\.)+[\w\-]{2,4}$',
                        ).hasMatch(value)) {
                          return 'អ៊ីមែលមិនត្រឹមត្រូវ';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 15),

                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: 'ពាក្យសម្ងាត់',
                        border: OutlineInputBorder(),
                        labelStyle: TextStyle(fontFamily: 'Khmer Battambang'),
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
                    onPressed: _isLoading
                        ? null
                        : () async {
                            if (_formKey.currentState!.validate()) {
                              await login();
                            }
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                        vertical: 15,
                        horizontal: 30,
                      ),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.zero,
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 22,
                            width: 22,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                              strokeWidth: 2,
                            ),
                          )
                        : const Text(
                            'ចូលគណនី',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'Khmer Battambang',
                            ),
                          ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        'ឬចូលជាមួយ',
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontFamily: 'Khmer Battambang',
                        ),
                      ),
                    ),
                    Expanded(child: Divider(color: Colors.grey.shade400)),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      onPressed: _isLoading
                          ? null
                          : () => _handleSocialSignIn(AuthService().signInWithGoogle),
                      icon: const FaIcon(FontAwesomeIcons.google, color: Colors.red),
                      iconSize: 40,
                    ),
                    IconButton(
                      onPressed: _isLoading
                          ? null
                          : () => _handleSocialSignIn(AuthService().signInWithFacebook),
                      icon: const FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                      iconSize: 40,
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      'មិនទាន់មានគណនី? ',
                      style: TextStyle(fontFamily: 'Khmer Battambang'),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (_) => const Register()),
                        );
                      },
                      child: const Text(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
