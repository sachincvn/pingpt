import 'package:flutter/material.dart';

class SentMessageWidget extends StatelessWidget {
  final String message;

  const SentMessageWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(left: 50),
        child: Container(
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 15, bottom: 15),
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xFF4c2988),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(5),
              ),
            ),
            child: Text(message)),
      ),
    );
  }
}
