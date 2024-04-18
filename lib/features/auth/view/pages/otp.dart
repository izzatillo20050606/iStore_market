// ignore: file_names
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:phone_store/features/auth/view/pages/register.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import '../../../home/pages/home_page.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _Otp();
}

final pintputCtr = TextEditingController(); //< text: "1234" >
final isEmptyctr = TextEditingController();

class _Otp extends State<Otp> {
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  int _secondsRemaining = 10;
  void startTimer() {
    var duration = const Duration(seconds: 1);
    Timer.periodic(
      duration,
      (timer) {
        setState(
          () {
            if (_secondsRemaining > 0) {
              _secondsRemaining--;
            } else if (_secondsRemaining == 0) {
              startTimer();
            } else {
              timer.cancel();
              // Timer finished, do something here if needed
            }
          },
        );
      },
    );
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 90;
    int remainingSeconds = seconds % 60;
    return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  void isEmpty() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 100, left: 150, bottom: 26, right: 150),
              child: Image.asset(
                "assets/images/logo_black.png",
                height: 100,
                width: 130,
              ),
            ),
            const Text(
              "Verification",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 38),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              " You have received an SMS code on your phone ",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.w700,
                  fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 24),
              child: PinCodeTextField(
                controller: pintputCtr,
                keyboardType: TextInputType.number,
                appContext: context,
                length: 5,
                cursorHeight: 50,
                cursorWidth: 20,
                textStyle: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                pinTheme: PinTheme(
                  activeColor: Colors.green,
                  errorBorderColor: Colors.red,
                  shape: PinCodeFieldShape.box,
                  borderWidth: 2,
                  fieldWidth: 50,
                  fieldHeight: 60,
                  inactiveColor: Colors.indigoAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Didn’t receive code?",
                ),
                TextButton(
                  onPressed: () {
                    // startTimer();
                    // setState(() {});
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Resend Now",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: Text(
                _formatTime(_secondsRemaining),
                style:
                    const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                onPressed: () {
                  if (pintputCtr.text.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                         shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        content: Text(
                          "Please fill in the blanks ? ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                  _formatTime(10);
                },
                child: const Text(
                  " Proceed ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
