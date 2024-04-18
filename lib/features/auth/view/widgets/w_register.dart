import 'package:flutter/material.dart';

// ignore: must_be_immutable
class WRegister extends StatelessWidget {
  WRegister({super.key, required this.controller, required this.hinttext});
  TextEditingController controller = TextEditingController();
  String hinttext = "";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
      child: TextField(
        keyboardType: TextInputType.text,
        controller: controller,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(14),
            ),
          ),
          hintText: hinttext,
        ),
      ),
    );
  }
}
