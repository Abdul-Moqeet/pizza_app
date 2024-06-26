import 'package:flutter/material.dart';

class SizeButton extends StatefulWidget {
  final String size_pizza;
  final bool isSelected;
  final VoidCallback onSelect;

  const SizeButton({
    super.key,
    required this.size_pizza,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  SizeButtonState createState() => SizeButtonState();
}

class SizeButtonState extends State<SizeButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: TextButton(
        style: widget.isSelected
            ? ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.orange),
              )
            : ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.transparent),
              ),
        onPressed: widget.onSelect,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
          ),
          height: 70,
          width: 70,
          child: Align(
            alignment: Alignment.center,
            child: Text(
              widget.size_pizza,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
