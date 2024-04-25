import 'package:flutter/material.dart';

class IntroPage1 extends StatelessWidget {
  const IntroPage1({super.key});

 

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 130),
            child: 
            Image.asset(
              'assets/gif/95601-finance.gif',
              height: 230,
            ),
          ),
          const SizedBox(
            height: 10,
           
          ),
          const Text(
            'Be easier to manage',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const Text(
            'your own money',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'just using your phone, you can manage',
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 94, 89, 89)),
          ),
          const Text(
            'as your cashflow more easy and detail',
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
