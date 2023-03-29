import 'package:flutter/material.dart';

class IntroPage3 extends StatelessWidget {
  const IntroPage3({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Container(decoration:BoxDecoration(image: DecorationImage(image: AssetImage('assets/gif/9697-ftw.gif')),),height: 200,)
            ),
            const SizedBox(
              height: 50,
            ),
            const Text(
              'Be more mindful spending.',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const Text(
              "So, let's get started!",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Be mindful spending and you will',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 94, 89, 89)),
            ),
            const Text(
              'be closer to financial freedom',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 94, 89, 89)),
            )
          ],
        ));
  }
}
