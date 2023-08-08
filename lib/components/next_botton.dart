import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class NextButton extends StatelessWidget {
  NextButton({Key? key, required this.onTap, required this.page_value}) : super(key: key);

  final void Function()? onTap;
  int page_value = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
        ),
        MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => onTap!(),
            child: Container(
              height: 40,
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                  color: Colors.cyan[900],
                  borderRadius:
                  BorderRadius.all(Radius.circular(5))),
              child: Row(
                children: [
                  Text(
                    page_value == 4 ? "Submit" : "OK",
                    style: TextStyle(
                        color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.done,
                    color: Colors.white,
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ).animate().scale(duration: Duration(seconds: 2), curve: Curves.easeIn);
  }
}
