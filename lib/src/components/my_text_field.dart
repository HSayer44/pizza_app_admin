import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final VoidCallback? onTap;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final FocusNode? focusNode;
  final String? errorMsg;
  final int? minLines;
  final int? maxLines;
  final List<TextInputFormatter>? inputFormatters;

  const MyTextField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.obscureText,
      required this.keyboardType,
      this.suffixIcon,
      this.prefixIcon,
      this.onTap,
      this.validator,
      this.onChanged,
      this.focusNode,
      this.errorMsg,
      this.minLines,
      this.maxLines = 1,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      minLines: minLines,
      maxLines: maxLines,
      onTap: onTap,
      textInputAction: TextInputAction.next,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade400),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary),
        ),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey[500]),
        errorText: errorMsg,
      ),
    );
  }
}
