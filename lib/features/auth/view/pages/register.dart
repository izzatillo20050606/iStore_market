// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:phone_store/common/serves/auth/login.dart';
import 'package:phone_store/common/serves/product/get_product.dart';
import 'package:phone_store/data/entitiy/Login_model.dart';
import 'package:phone_store/data/entitiy/register_model.dart';
import 'package:phone_store/data/repazetoriy/app_repazetoriy_implements.dart';
import 'package:phone_store/features/auth/view/pages/otp.dart';
import 'package:phone_store/features/auth/view/widgets/w_register.dart';

import '../../../../main.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController ismcontroller =
      TextEditingController(text: preferences.getString("ism"));
  TextEditingController familyacontroller =
      TextEditingController(text: preferences.getString("familya"));
  TextEditingController phonecontroller =
      TextEditingController(text: preferences.getString("phone"));
  TextEditingController password1ctr = TextEditingController();
  TextEditingController password2ctr = TextEditingController();
  bool isChecked = false;
  AppRepazetoriyImplement appRepazetoriyImplement = AppRepazetoriyImplement();
  @override
  Widget build(BuildContext context) {
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
              "Register",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            const Text(
              "Enter your details to register",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: Color.fromARGB(255, 60, 59, 59),
              ),
            ),
            WRegister(controller: ismcontroller, hinttext: "Name"),
            WRegister(controller: familyacontroller, hinttext: "Surname"),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: IntlPhoneField(
                controller: phonecontroller,
                keyboardType: TextInputType.phone,
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
            WRegister(controller: password1ctr, hinttext: "Password"),
            WRegister(controller: password2ctr, hinttext: "Confirm Password"),
            const SizedBox(
              height: 25,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 10, left: 20, right: 20, bottom: 10),
              child: Row(
                children: [
                  Checkbox(
                      value: isChecked,
                      onChanged: (newValue) {
                        isChecked = newValue!;
                        setState(() {});
                      }),
                  const Text(
                    "I agree with the terms and conditions",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Color.fromARGB(255, 60, 59, 59),
                    ),
                  ),
                ],
              ),
            ),
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
                  debugPrint(box.get('token'));
                  RegisterModel registerModel = RegisterModel(
                      phoneNumber: "+998$phonecontroller",
                      password: password1ctr.text.trim(),
                      password2: password2ctr.text.trim(),
                      firstName: ismcontroller.text.trim(),
                      lastName: familyacontroller.text.trim());
                  debugPrint(registerModel.phoneNumber.toString());
                  if (ismcontroller.text.isNotEmpty &&
                      familyacontroller.text.isNotEmpty &&
                      phonecontroller.text.isNotEmpty &&
                      password1ctr.text.isNotEmpty &&
                      password2ctr.text.isNotEmpty &&
                      isChecked == true) {
                    if (password1ctr == password2ctr) {
                      await appRepazetoriyImplement
                          .postAll(registerModel.toJson());
                      debugPrint("${registerModel.toJson()}");
                      LoginModel loginModel = LoginModel(
                          phoneNumber:
                              "+998${phonecontroller.text}".trim().toString(),
                          password: password1ctr.text.trim().toString());
                      await AuthLoginServices.getToken(loginModel);
                      await ProductServices.getAllProducts();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Otp(),
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
                            "Enter the same password as the confirm password ",
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
                    preferences.setString("ism", ismcontroller.text);
                    preferences.setString("familya", familyacontroller.text);
                    preferences.setString("phone", phonecontroller.text);
                    preferences.setString("password", password1ctr.text);
                    ismcontroller.clear();
                    familyacontroller.clear();
                    phonecontroller.clear();
                    password1ctr.clear();
                    password2ctr.clear();
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
                },
                child: const Text(
                  "Next",
                  style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            )
          ],
        ),
      ),
    );
  }
}
