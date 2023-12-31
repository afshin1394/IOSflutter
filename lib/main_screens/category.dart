import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/header.png',
            height: MediaQuery.of(context).size.height * 0.20,
            width: 350.0,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
            width: 50,
          ),
          const Text('Welcome',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
              )),
        ],
      ),
    );
  }
}
