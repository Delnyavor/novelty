import 'package:flutter/material.dart';
import 'package:novelty/common/theming/app_colors.dart';

class AuthInput extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool? obscure;
  final Function(String)? onChanged;
  final String? errorText;
  final TextInputType? keyBoardType;
  const AuthInput({
    Key? key,
    this.validator,
    required this.controller,
    required this.hint,
    this.obscure,
    this.onChanged,
    this.errorText,
    this.keyBoardType,
  }) : super(key: key);

  @override
  State<AuthInput> createState() => _AuthInputState();
}

class _AuthInputState extends State<AuthInput> {
  bool invisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: shouldObscure(),
      style: const TextStyle(fontSize: 12, color: Colors.white),
      keyboardType: widget.keyBoardType,
      cursorColor: AppColors.gold,
      decoration: InputDecoration(
        hintText: widget.hint,
        hintStyle: const TextStyle(color: AppColors.light),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 20,
        ),
        suffixIcon: iconBuilder(),
        suffixIconColor: Colors.white,
        errorText: widget.errorText,
        errorStyle: const TextStyle(height: 0.8),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(width: 0.7, color: AppColors.light.withOpacity(0))),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(width: 1, color: AppColors.light.withOpacity(0.5))),
        focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide:
                BorderSide(width: 1, color: Colors.red.withOpacity(0.5))),
      ),
      onChanged: widget.onChanged,
    );
  }

  Widget iconBuilder() {
    if (widget.obscure != null && widget.obscure == true) {
      return suffixIcon();
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget suffixIcon() {
    return GestureDetector(
      onTap: () {
        setState(() {
          invisible = !invisible;
        });
      },
      child: Icon(invisible ? Icons.visibility_off_outlined : Icons.visibility),
    );
  }

  bool shouldObscure() {
    if (widget.obscure != null && widget.obscure == true) {
      return invisible;
    } else {
      return false;
    }
  }
}
