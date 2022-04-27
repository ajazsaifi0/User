import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Text(
                  "Our friendly customer support team is your extended family. Speak "
                  "your heart out. They listen with undivided attention to resolve your concerns. Give us a call, request a "
                  "callback or drop us an email, we’re here to help.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: GestureDetector(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff0f5ff)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              child: Icon(Icons.send),
                            ),
                            Text(
                              "General Enquiries",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "contact@bhs.in",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    _sendingMails('mail');
                  },
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                child: GestureDetector(
                  child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.black,
                            width: 1,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xfff0f5ff)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 50,
                              width: 70,
                              child: Icon(Icons.headset_mic_sharp),
                            ),
                            Text(
                              "Customer Sales Enquiry",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              "1234567890",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w700),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  onTap: () {
                    _sendingMails('tel');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

_sendingMails(String input) async {
  String url;
  if (input.contains('mail')) {
    url = 'mailto:contact@bhs.in';
    await launch(url);
  } else {
    url = 'tel:1234567890';
    await launch(url);
  }
  // if (await canLaunch(url)) {
  //   await launch(url);
  // } else {
  //   throw 'Could not launch $url';
  // }
}
