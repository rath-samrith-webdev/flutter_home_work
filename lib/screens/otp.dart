import 'package:flutter/material.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();
  //originall opt code as example is 123456, you can change it to any code you want
  final String _correctOtp = '123456';
  void validateOtp() {
    if (_otpController.text == _correctOtp) {
      // OTP is correct, proceed to the next step
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ការបញ្ជាក់!', textAlign: TextAlign.center),
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('លេខកូដ OTP ត្រឹមត្រូវ! អ្នកបានផ្ទៀងផ្ទាត់ដោយជោគជ័យ.'),
                  SizedBox(height: 25),
                  Icon(Icons.check_circle, color: Colors.green, size: 50),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  // You can navigate to the next screen here if needed
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text('បិទ', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    } else {
      // OTP is incorrect, show an error message
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('ការបញ្ជាក់!', textAlign: TextAlign.center),
            content: SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('លេខកូដ OTP មិនត្រឹមត្រូវ! សូមព្យាយាមម្តងទៀត.'),
                  SizedBox(height: 10),
                  Icon(Icons.error, color: Colors.red, size: 40),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                child: Text('បិទ', style: TextStyle(color: Colors.white)),
              ),
            ],
          );
        },
      );
    }
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
                const SizedBox(height: 10), // Add some space at the top
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/splash.png',
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 30),
                    Column(
                      children: [
                        Text(
                          'សូមបញ្ចូលលេខកូដ OTP ដែលបានផ្ញើទៅអ៊ីមែលរបស់អ្នក',
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(6, (index) {
                        return Container(
                          width: 40,
                          height: 50,
                          margin: EdgeInsets.symmetric(horizontal: 5),
                          child: TextFormField(
                            controller: TextEditingController(
                              text: index < _otpController.text.length
                                  ? _otpController.text[index]
                                  : '',
                            ),
                            keyboardType: TextInputType.number,
                            textAlign: TextAlign.center,
                            maxLength: 1,
                            decoration: InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (value) {
                              if (value.length == 1 && index < 5) {
                                FocusScope.of(context).nextFocus();
                              }
                              if (value.isEmpty && index > 0) {
                                FocusScope.of(context).previousFocus();
                              }
                              String currentOtp = _otpController.text;
                              if (currentOtp.length > index) {
                                currentOtp =
                                    currentOtp.substring(0, index) +
                                    value +
                                    currentOtp.substring(index + 1);
                              } else {
                                currentOtp += value;
                              }
                              _otpController.text = currentOtp;
                            },
                          ),
                        );
                      }),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'មិនទាន់ទទួលបានលេខកូដ? ',
                          style: TextStyle(fontSize: 14),
                        ),
                        TextButton(
                          onPressed: () {
                            // Implement resend OTP functionality here
                          },
                          child: Text('ផ្ញើឡើងវិញ'),
                        ),
                      ],
                    ),
                  ],
                ),

                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: validateOtp,
                        style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(Colors.blue),
                          padding: WidgetStatePropertyAll(
                            EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        child: Text(
                          'បញ្ជាក់',
                          style: TextStyle(fontSize: 18, color: Colors.white),
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
