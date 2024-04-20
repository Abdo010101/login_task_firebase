import 'package:flutter/material.dart';
import 'package:login_task/cores/utils/styles.dart';

class HomeScrenn extends StatelessWidget {
  const HomeScrenn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Text(
            'Login Success',
            style: Styles.styleHeader,
          ))
        ],
      ),
    );
  }
}
