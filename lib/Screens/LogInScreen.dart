import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'OTPScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneNumber = "";
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/12.jpeg"),
                        fit: BoxFit.cover)),
                // child: Image.asset(
                //
                //   height: MediaQuery.of(context).size.height * 0.5,
                //   width: MediaQuery.of(context).size.width * 1,
                // ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "Enter Your Phone Number",
              style: TextStyle(
                  color: Color(0xff897A5F),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "We Will Send You 6 Digit Verification Code",
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IntlPhoneField(
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  print(phone.completeNumber);
                  setState(() {
                    phoneNumber = phone.completeNumber;
                  });
                },
              ),
            ),
            Container(
                color: Color(0xffFFFFFF),
                height: 50,
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                    onPressed: () {
                      if (phoneNumber.length < 10) {
                        FocusScope.of(context).unfocus();
                        _scaffoldkey.currentState!.showSnackBar(
                            SnackBar(content: Text("Enter Valid Number")));
                      } else {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OTPScreen(phoneNumber)));
                      }
                    },
                    child: Text(
                      "Send OTP",
                      style: TextStyle(fontSize: 18),
                    )))
          ],
        ),
      ),
    );
  }
}
