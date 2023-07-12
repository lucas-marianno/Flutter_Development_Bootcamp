import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.color,
  });

  final String label;
  final Function onPressed;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: label,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: color,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: () => onPressed(),
            minWidth: 200.0,
            height: 42.0,
            child: Text(
              label,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

class RoundedTextField extends StatefulWidget {
  const RoundedTextField({
    super.key,
    required this.hint,
    required this.outlineColor,
    required this.onChanged,
  });

  final String hint;
  final Color outlineColor;
  final Function(String value) onChanged;

  @override
  State<RoundedTextField> createState() => _RoundedTextFieldState();
}

class _RoundedTextFieldState extends State<RoundedTextField> {
  bool isObscure = false;
  Widget? sufixIcon;

  @override
  void initState() {
    super.initState();

    if (widget.hint.contains('password')) {
      isObscure = true;
      sufixIcon = IconButton(
        onPressed: () => toggleVisibility(),
        icon: const Icon(Icons.visibility_off),
      );
    }
  }

  toggleVisibility() {
    setState(() {
      isObscure = isObscure ? false : true;
      sufixIcon = IconButton(
        onPressed: () => toggleVisibility(),
        icon: Icon(isObscure ? Icons.visibility_off : Icons.visibility),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: isObscure ? null : TextInputType.emailAddress,
      obscureText: isObscure,
      onChanged: (value) => widget.onChanged(value),
      decoration: InputDecoration(
        suffixIcon: sufixIcon,
        hintText: widget.hint,
        hintStyle: const TextStyle(color: Colors.grey),
        contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.outlineColor,
            width: 2,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.outlineColor,
            width: 4,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
