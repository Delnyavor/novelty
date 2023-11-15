import 'package:flutter/material.dart';

class InputField extends StatefulWidget {
  final TextEditingController controller;
  final String hint;
  final String? errorText;
  final String? Function(String?)? validator;
  final Function(String)? onChanged;
  final bool? obscure;
  final bool? enabled;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final bool revealBorder;
  final TextInputType? inputType;

  const InputField({
    Key? key,
    this.validator,
    required this.controller,
    required this.hint,
    this.obscure,
    this.onChanged,
    this.errorText,
    this.enabled = true,
    this.prefix,
    this.suffix,
    this.maxLines = 1,
    this.revealBorder = true,
    this.inputType,
  }) : super(key: key);

  @override
  State<InputField> createState() => _InputFieldState();
}

class _InputFieldState extends State<InputField> {
  bool invisible = true;
  FocusNode focusNode = FocusNode();
  bool hasfocus = false;

  @override
  void initState() {
    super.initState();
    focusNode.addListener(() {
      if (focusNode.hasFocus && !hasfocus) {
        setState(() {
          hasfocus = true;
        });
      } else if (!focusNode.hasFocus && hasfocus) {
        setState(() {
          hasfocus = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: widget.inputType,
      focusNode: focusNode,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: widget.controller,
      obscureText: shouldObscure(),
      obscuringCharacter: '*',
      maxLines: widget.maxLines,
      minLines: 1,
      style: const TextStyle(fontSize: 12),
      cursorColor: Colors.lightBlue,
      enabled: widget.enabled,
      decoration: InputDecoration(
        hintText: widget.hint,
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 20,
        ),
        prefix: widget.prefix,
        border: InputBorder.none,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: buildBorder(),
        ),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13), borderSide: buildBorder()),
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        errorText: widget.errorText,
        disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(13),
            borderSide: BorderSide.none),
        suffixIcon: widget.suffix,
      ),
      onChanged: widget.onChanged,
    );
  }

  BorderSide buildBorder() {
    return widget.revealBorder
        ? BorderSide(
            width: hasfocus ? 1 : 0,
            color: hasfocus ? Colors.lightBlue : Colors.black26,
          )
        : BorderSide.none;
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
