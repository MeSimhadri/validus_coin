import 'package:flutter/material.dart';

TextFormField profileTextFormField({required String label, required TextEditingController controller, String? Function(String?)? validator}) {
  return TextFormField(
    cursorColor: const Color(0XFFFFB802),
    controller: controller,
    validator: (value) => validator!(value),
    style: const TextStyle(color: Color(0XFFD2D2D2), fontSize: 18),
    decoration: InputDecoration(
        border: InputBorder.none,
        label: Text(
          label,
          style: const TextStyle(color: Color(0XFFA1A1A1), fontSize: 14),
        ),
        fillColor: const Color(0XFF2F3444),
        filled: true,
        focusedBorder: InputBorder.none),
  );
}
