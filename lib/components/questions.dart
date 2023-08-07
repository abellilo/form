import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  String number;
  String question;
  Question({Key? key,
    required this.number,
    required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            number,
            style: TextStyle(fontSize: 17,color: Colors.green[900]),
          ),
          width: 20,
          alignment: Alignment.centerRight,
        ),
        Container(
          child: Icon(
            Icons.play_arrow_sharp,
            size: 15,
            color: Colors.cyan[900],
          ),
          width: 20,
          alignment: Alignment.centerLeft,
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            alignment: Alignment.centerLeft,
            child: Text(
              question,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
      ],
    );
  }
}
