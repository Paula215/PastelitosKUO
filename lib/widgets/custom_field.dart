import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  const CustomField({
    Key? key,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.label,
    this.hint,
    this.icon,
  }) : super(key: key);

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final IconData? icon;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        obscureText: obscureText,
        decoration: InputDecoration(
          icon: Icon(icon, color: const Color(0xFF8B0D32)),
          hintText: hint,
          hintStyle: const TextStyle(color: Colors.grey),
          labelText: label,
          labelStyle: const TextStyle(color: Color(0xFF8B0D32)),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
