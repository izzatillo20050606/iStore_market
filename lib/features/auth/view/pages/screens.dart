import 'package:flutter/material.dart';
import 'package:phone_store/features/auth/view/pages/2screen.dart';
import 'package:phone_store/features/home/pages/home_page.dart';
import 'package:phone_store/main.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  // ignore: must_call_super
  void initState() {
    Future.delayed(
      const Duration(seconds: 3),
      () {
        if (box.get("token") != null) {
          box.get('token');
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );
        } else {
          return Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Screen2(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 330),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/logo_white.png",
                  height: 130,
                  width: 130,
                ),
              ),
              const SizedBox(
                height: 14,
              ),
              Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.grey,
                    color: Colors.white,
                    minHeight: 5,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
