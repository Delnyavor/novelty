import 'package:flutter/material.dart';

class BookActionIconButton extends StatefulWidget {
  final IconData icon;
  final IconData? selectedIcon;
  final bool? isSelected;
  final void Function() onPressed;
  const BookActionIconButton(
      {super.key,
      required this.icon,
      this.isSelected,
      required this.onPressed,
      this.selectedIcon});

  @override
  State<BookActionIconButton> createState() => _BookActionIconButtonState();
}

class _BookActionIconButtonState extends State<BookActionIconButton> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.secondary.withOpacity(0.07),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: IconButton(
        padding: const EdgeInsets.all(4),
        onPressed: widget.onPressed,
        iconSize: 16,
        isSelected: widget.isSelected ?? false,
        visualDensity: VisualDensity.compact,
        icon: Icon(widget.icon),
        selectedIcon: Icon(
          widget.selectedIcon ?? widget.icon,
        ),
      ),
    );
  }
}
