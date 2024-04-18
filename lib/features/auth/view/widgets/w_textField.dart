import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class WTextField extends StatelessWidget {
  TextEditingController controllerr;
  String hintTest = "";
  Icon icon;
  WTextField({
    super.key,
    required this.controllerr,
    required this.hintTest,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextField(
        controller: controllerr,
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          suffixIcon: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.edit_outlined),
          ),
          hintText: hintTest,
        ),
      ),
    );
  }
}
