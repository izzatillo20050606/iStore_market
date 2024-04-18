import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_store/common/serves/auth/login.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/data/entitiy/Login_model.dart';
import 'package:phone_store/data/repazetoriy/app_repazetoriy_implements.dart';
import 'package:phone_store/features/auth/view/pages/register.dart';
import 'package:phone_store/features/home/pages/home_page.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  AppRepazetoriyImplement appRepazetoriyImplement = AppRepazetoriyImplement();

  @override
  Widget build(BuildContext context) {
    TextEditingController phonectr = TextEditingController();
    TextEditingController passwordctr = TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
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
              "Login",
              style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontWeight: FontWeight.bold,
                  fontSize: 38),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Enter your username and password to login",
              style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.w400,
                  fontSize: 16),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: IntlPhoneField(
                keyboardType: TextInputType.phone,
                controller: phonectr,
                decoration: const InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(14),
                    ),
                  ),
                ),
                initialCountryCode: 'UZ',
                onChanged: (phone) {},
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                controller: passwordctr,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14)),
                  prefixIcon: const Icon(Icons.password),
                  hintText: "Password",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot password ?   ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 150),
            SizedBox(
              height: 70,
              width: 300,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                ),
                onPressed: () async {
                  LoginModel loginModel = LoginModel(
                      phoneNumber: "+998${phonectr.text}".trim().toString(),
                      password: passwordctr.text.trim().toString());
                  if (phonectr.text.isNotEmpty && passwordctr.text.isNotEmpty) {
                    await AuthLoginServices.getToken(loginModel);
                    await ProductServices.getAllProducts();
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomePage(),
                      ),
                    );
                    // if (box.get('token')!=null) {
                    //    Navigator.push(
                    //   // ignore: use_build_context_synchronously
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => HomePage(),
                    //   ),
                    // );
                    // } else {
                    //    // ignore: use_build_context_synchronously
                    //    ScaffoldMessenger.of(context).showSnackBar(
                    //   const SnackBar(
                    //     content: Text(
                    //       "you have not registered before",
                    //       textAlign: TextAlign.center,
                    //       style: TextStyle(
                    //           color: Colors.white,
                    //           fontSize: 26,
                    //           fontWeight: FontWeight.bold),
                    //     ),
                    //     backgroundColor: Colors.red,
                    //   ),
                    // );
                    // }
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
                          " wrong number or password error ",
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
                },
                child: const Text(
                  "Login",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
