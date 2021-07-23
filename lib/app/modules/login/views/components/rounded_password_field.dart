import 'package:anuncios_ui/app/modules/login/views/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';

class RoundedPasswordField extends StatefulWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key? key,
    required this.hintText,
    this.icon = Icons.app_blocking_outlined,
    required this.onChanged,
  }) : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool visibleBool = false;
  final textFieldFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: visibleBool,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
        onChanged: widget.onChanged,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.grey.shade400,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                visibleBool = !visibleBool;
              });
            },
            icon: Icon(
              (visibleBool) ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey,
            ),
          ),
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
        ),
      ),
    );
  }
}
