import 'package:flutter/material.dart';

class Final_Page extends StatelessWidget {
  const Final_Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Image.asset("lib/images/cropped logo.png"),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Thank you",
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.cyan[900]
                ),),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text("Copyright 2023"),
            )
          ],
        ),
      ),
    );
  }
}
