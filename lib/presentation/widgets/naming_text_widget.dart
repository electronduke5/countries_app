import 'package:flutter/material.dart';

class NamingTextWidget extends StatelessWidget {
  const NamingTextWidget({super.key, required this.name, required this.text});

  final String name;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$name: ',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            text,
            style: const TextStyle(fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
