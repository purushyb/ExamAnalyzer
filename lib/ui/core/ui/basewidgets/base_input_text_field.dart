import 'package:flutter/material.dart';

class BaseInputTextField extends StatefulWidget {
  const BaseInputTextField({
    super.key,
    required this.onChanged,
    required this.label,
    this.initialValue,
  });
  final void Function(String userInput) onChanged;
  final String label;
  final String? initialValue;

  @override
  State<BaseInputTextField> createState() => _BaseInputTextFieldState();
}

class _BaseInputTextFieldState extends State<BaseInputTextField> {
  TextEditingController? _controller;
  @override
  void initState() {
    _controller = TextEditingController(text: widget.initialValue);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant BaseInputTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue &&
        widget.initialValue != _controller?.text) {
      _controller?.text = widget.initialValue ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: TextField(
        controller: _controller,
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        onChanged: widget.onChanged,
      ),
    );
  }
}
