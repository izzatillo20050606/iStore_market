import 'package:flutter/material.dart';

Widget buildNotificationButton() {
  return Container(
    width: 40,
    height: 40,
    decoration: const BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.white,
    ),
    child: IconButton(
      onPressed: () {},
      icon: const Icon(Icons.favorite_outline_rounded),
    ),
  );
}
