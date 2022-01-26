import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  CustomTextField(
      {Key? key,
      required this.hintText,
      required this.initialValue,
      required this.onChanged,
      this.inputFormatters,
      this.validator,
      this.maxLength})
      : super(key: key);

  final String? initialValue;
  final Function(String) onChanged;
  final String hintText;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final String? Function(String?)? validator;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final _focusNode = FocusNode();

  final _borderStyle = OutlineInputBorder(
      borderSide: const BorderSide(
        color: Color(0xfffafafa),
      ),
      borderRadius: BorderRadius.circular(8));

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus) setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        focusNode: _focusNode,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        maxLength: widget.maxLength,
        inputFormatters: widget.inputFormatters,
        validator: (value) {
          if (_focusNode.hasFocus) {
            print('ignored');
            return null;
          } else {
            print('called');

            return widget.validator?.call(value);
          }
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
          fillColor: Colors.grey.withOpacity(0.1),
          filled: true,
          enabledBorder: _borderStyle,
          focusedBorder: _borderStyle,
          hintText: widget.hintText,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
        ),
      ),
    );
  }
}
