import 'package:anuncios_ui/app/modules/login/views/components/TextFieldContainer.dart';
import 'package:flutter/material.dart';

class RoundedInputPassword extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputPassword(
      {Key? key,
      required this.hintText,
      this.icon = Icons.app_blocking_outlined,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        style: TextStyle(
          color: Colors.grey.shade600,
        ),
        onChanged: onChanged,
        cursorColor: Colors.green,
        decoration: InputDecoration(
          icon: Icon(
            icon,
            color: Colors.grey.shade400,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.grey.shade400,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
