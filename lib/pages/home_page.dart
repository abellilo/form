import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import '../components/bottomactions.dart';
import '../components/next_botton.dart';
import '../components/questions.dart';
import 'final_page.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  String gender = "";
  String level = "";
  String selected_job = "";
  int pageview_value = 0;

  PageController _controller = PageController();

  TextEditingController _controller_1 = new TextEditingController();
  TextEditingController _controller_2 = new TextEditingController();
  TextEditingController _controller_4 = new TextEditingController();
  TextEditingController _controller_5 = new TextEditingController();

  final List<String> genderItems = ['Male', 'Female', "Other"];

  //modify sent message
  String replacing(String word) {
    word = word.replaceAll("'", "{(L!I_0)}");
    word = word.replaceAll(r'\', r'\\');
    return word;
  }

  String modify(String word) {
    word = word.replaceAll("{(L!I_0)}", "'");
    word = word.replaceAll(r'\', r'\\');
    return word;
  }

  void submit() async {
    setState(() {
      _selectedpage = 1;
    });

    await Future.delayed(const Duration(seconds: 5));

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return Final_Page();
    })).whenComplete(() => reset_page());
  }

  void reset_page() {
    setState(() {
      _selectedpage = 0;
      pageview_value = 0;
    });
  }

  void nextpage() {
    if (pageview_value == 4) {
      submit();
    } else {
      _controller.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeIn,
      ).then((value) {
        FocusScope.of(context).unfocus();
      });
    }
  }

  int _selectedpage = 0;

  double sized_height = 10;
  double second_sized_height = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: _selectedpage == 0
            ? Stack(
                children: [
                  PageView(
                    onPageChanged: (val) {
                      setState(() {
                        pageview_value = val;
                      });
                    },
                    controller: _controller,
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        padding: MediaQuery.of(context).size.width > 700
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6)
                            : EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Question
                            Question(
                                    number: '1',
                                    question: "What's your full name?"),
                            SizedBox(
                              height: sized_height,
                            ),
                            //Textfield
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: TextField(
                                      style: TextStyle(fontSize: 30),
                                      controller: _controller_1,
                                      onSubmitted: (val) {
                                        // _controller_1.text = val;
                                        _controller.nextPage(
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeIn).then((value) {
                                          FocusScope.of(context).unfocus();
                                        });;
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Type your answer here...",
                                          hintStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.cyan[100])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: second_sized_height,
                            ),
                            //button
                            NextButton(
                                onTap: nextpage, page_value: pageview_value),
                          ],
                        ),
                      ),
                      Container(
                        padding: MediaQuery.of(context).size.width > 700
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6)
                            : EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Question
                            Question(
                                    number: '2',
                                    question: "Kindly tell us your Age"),
                            SizedBox(
                              height: sized_height,
                            ),
                            //Textfield
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: 30),
                                      controller: _controller_2,
                                      onSubmitted: (val) {
                                        // _controller_1.text = val;
                                        nextpage();
                                      },
                                      decoration: InputDecoration(
                                          hintText: "Type your answer here...",
                                          hintStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.cyan[100])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: second_sized_height,
                            ),
                            //button
                            NextButton(
                                onTap: nextpage, page_value: pageview_value),
                          ],
                        ),
                      ),
                      Container(
                        padding: MediaQuery.of(context).size.width > 700
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6)
                            : EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Question
                            Question(number: '3', question: "Pick a Sex"),
                            SizedBox(
                              height: sized_height,
                            ),
                            //Textfield
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: DropdownButtonFormField2(
                                      decoration: InputDecoration(
                                        hoverColor: Colors.cyan[100],
                                        filled: true,
                                        fillColor: Colors.white,
                                        //Add isDense true and zero Padding.
                                        //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
                                        isDense: true,
                                        contentPadding: EdgeInsets.zero,
                                        border: UnderlineInputBorder(),
                                        //Add more decoration as you want here
                                        //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
                                      ),
                                      isExpanded: true,
                                      hint: Text(
                                        'Select Your Gender',
                                        style: TextStyle(
                                            fontSize: 22,
                                            color: Colors.cyan.shade100),
                                      ),
                                      items: genderItems
                                          .map((item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.cyan[900]),
                                                ),
                                              ))
                                          .toList(),
                                      // validator: (value) {
                                      //   if (value == null) {
                                      //     return 'Please select gender.';
                                      //   }
                                      //   return null;
                                      // },
                                      onChanged: (value) {
                                        //Do something when changing the item if you want.
                                        gender = value.toString();
                                      },
                                      onSaved: (value) {
                                        gender = value.toString();
                                      },
                                      buttonStyleData: const ButtonStyleData(
                                          height: 60, padding: EdgeInsets.zero),
                                      iconStyleData: IconStyleData(
                                        icon: Icon(
                                          Icons.arrow_drop_down,
                                          color: Colors.cyan[900],
                                        ),
                                        iconSize: 30,
                                      ),
                                      dropdownStyleData: DropdownStyleData(
                                        decoration: BoxDecoration(
                                            color: Colors.cyan[100]),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: second_sized_height,
                            ),
                            //button
                            NextButton(
                                onTap: nextpage, page_value: pageview_value),
                          ],
                        ),
                      ),
                      Container(
                        padding: MediaQuery.of(context).size.width > 700
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6)
                            : EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Question
                            Question(
                                    number: '4',
                                    question: "What's your phone number?"),
                            SizedBox(
                              height: sized_height,
                            ),
                            //Textfield
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: TextField(
                                      style: TextStyle(fontSize: 30),
                                      controller: _controller_4,
                                      keyboardType: TextInputType.number,
                                      onSubmitted: (val) {
                                        // _controller_1.text = val;
                                        _controller.nextPage(
                                            duration:
                                                Duration(milliseconds: 400),
                                            curve: Curves.easeIn).then((value) {
                                          FocusScope.of(context).unfocus();
                                        });
                                      },
                                      decoration: InputDecoration(
                                          hintText: "07012345678",
                                          hintStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.cyan[100])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: second_sized_height,
                            ),
                            //button
                            NextButton(
                                onTap: nextpage, page_value: pageview_value),
                          ],
                        ),
                      ),
                      Container(
                        padding: MediaQuery.of(context).size.width > 700
                            ? EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width / 6)
                            : EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //Question
                            Question(
                                    number: '5',
                                    question:
                                        "Tell us your second phone number. If you have?"),
                            SizedBox(
                              height: sized_height,
                            ),
                            //Textfield
                            Row(
                              children: [
                                SizedBox(
                                  width: 50,
                                ),
                                Expanded(
                                  child: Container(
                                    height: 50,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      style: TextStyle(fontSize: 30),
                                      controller: _controller_5,
                                      onSubmitted: (val) {
                                        if (val.isNotEmpty) {
                                          submit();
                                        }
                                      },
                                      decoration: InputDecoration(
                                          hintText: "07012345678",
                                          hintStyle: TextStyle(
                                              fontSize: 22,
                                              color: Colors.cyan[100])),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: second_sized_height,
                            ),
                            //button
                            NextButton(
                                onTap: nextpage, page_value: pageview_value),
                          ],
                        ),
                      ),
                    ],
                  ),
                  BottomAction(
                    controller: _controller,
                  )
                ],
              )
            : Center(
                child: SpinKitSpinningLines(
                  color: Colors.cyan.shade900,
                  size: 90,
                ),
              ),
      ),
    );
  }
}
