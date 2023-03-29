import 'package:flutter/material.dart';

class IntroPage2 extends StatelessWidget {
  const IntroPage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Image.asset(
              'assets/gif/94586-finance.gif',
              height: 230,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Be more flexible',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const Text(
            'and secure',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            '',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 94, 89, 89)),
          ),
          const Text(
            "Use this platform in all your device, don't",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 94, 89, 89)),
          ),
          const Text(
            "worry about anything. We protect you.",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 94, 89, 89)),
          )
        ],
      ),
    );
  }
}
