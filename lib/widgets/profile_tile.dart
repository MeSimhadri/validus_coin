import 'package:flutter/material.dart';

Widget profileTile({required String title, required String subTitle, required Function onPressed}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, color: Colors.white)),
            TextButton(
              onPressed: () => onPressed(),
              child: const Text(
                'Edit',
                style: TextStyle(fontSize: 18, color: Colors.white, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
        Text(
          subTitle,
          style: const TextStyle(color: Color(0XFFA1A1A1), fontSize: 20),
        )
      ],
    ),
  );
}
