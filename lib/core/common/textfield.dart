import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final TextEditingController? mycontroller;
  final String? Function(String?)? validator;
  final int? maxLines;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.suffixIcon,
    required this.obscureText,
    this.mycontroller,
    this.prefixIcon,
    this.keyboardType,
    this.validator,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 16,
        letterSpacing: 1,
        fontWeight: FontWeight.w400,
        color: Colors.black,
      ),
      obscureText: obscureText,
      controller: mycontroller,
      validator: validator,
      //  maxLines: maxLines,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          errorStyle: const TextStyle(fontSize: 14),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(10),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide:
                const BorderSide(color: Color.fromARGB(255, 203, 202, 202)),
          ),
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          hintText: hintText,
          filled: true,
          fillColor: Colors.grey.shade300,
          hintStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: Colors.grey.shade700,
          )),
    );
  }
}
