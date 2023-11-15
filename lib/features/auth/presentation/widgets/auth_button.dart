import 'package:flutter/material.dart';

import '../../../../common/theming/app_colors.dart';

class AuthButton extends StatelessWidget {
  final void Function() onPressed;
  final String label;
  final bool light;
  final bool flex;
  const AuthButton(
      {Key? key,
      required this.onPressed,
      required this.label,
      this.light = false,
      this.flex = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (flex) {
      return Row(children: [Expanded(child: button(context))]);
    } else {
      return button(context);
    }
  }

  TextButton button(context) => TextButton(
        style: buttonTheme(context),
        onPressed: onPressed,
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: light ? AppColors.s4 : Colors.white,
                // fontWeight: FontWeight.4,
                letterSpacing: 0.2,
              ),
        ),
      );

  ButtonStyle buttonTheme(context) => TextButton.styleFrom(
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        backgroundColor: light ? AppColors.light : AppColors.s1,
      );
}
