import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pingpt/core/utils/styles.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 5),
      child: Row(
        children: [
          const Text(
            "PinGPT",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
          ),
          const Spacer(),
          Container(
            height: 50,
            width: 50,
            decoration: const BoxDecoration(
              color: Color.fromARGB(139, 40, 32, 73),
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            child: const Icon(
              size: 20,
              CupertinoIcons.delete,
              color: AppTheme.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
