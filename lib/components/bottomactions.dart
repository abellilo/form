import 'package:flutter/material.dart';

class BottomAction extends StatelessWidget {
  PageController controller;

  BottomAction({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.all(15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: 35,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  controller.nextPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.cyan[900],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  )),
            ),
            SizedBox(
              width: 2,
            ),
            Container(
              alignment: Alignment.center,
              height: 35,
              child: IconButton(
                icon: Icon(
                  Icons.keyboard_arrow_up,
                  color: Colors.white,
                  size: 25,
                ),
                onPressed: () {
                  controller.previousPage(
                      duration: Duration(milliseconds: 400),
                      curve: Curves.easeIn);
                },
              ),
              decoration: BoxDecoration(
                  color: Colors.cyan[900],
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  )),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 10),
              height: 35,
              child: RichText(
                text: TextSpan(
                    text: 'Powered by ',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                    children: [
                      TextSpan(
                        text: "Lilo",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.cyan[900],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
