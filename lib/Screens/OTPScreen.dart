import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:bengal_home_service/Screens/SelectLocation.dart';
import 'package:bengal_home_service/Screens/SetLocationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../Constants.dart';
import '../Services/Api.dart';
import 'SignUp.dart';

class OTPScreen extends StatefulWidget {
  final String phoneNumber;
  OTPScreen(this.phoneNumber);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String _verificationCode = "";
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  var api=new Api();
  CheckUser() async{
    var RequestBody={
      "mobile_no":widget.phoneNumber.toString()
    };
    dynamic response= await api.ApiCallingWithRequestBody("/user/Check.php",RequestBody);
    if(response["message"]=="not-exist"){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(widget.phoneNumber)));
    }else{
     // getdata();
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      setState(() {
        Constants.Id=response["data"][0]["Id"];
        Constants.name=response["data"][0]["name"];
        Constants.mobile_no=response["data"][0]["mobile_no"];
        Constants.email=response["data"][0]["email"];
        Constants.dob=response["data"][0]["dob"];
        Constants.ProfileLink=response["data"][0]["profile"];
      });
      await HelperFunctions.saveUserNameInSharedPrefrence(widget.phoneNumber.toString());
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => SelectLocation()));
    }
  }



  @override
  void initState() {
    // TODO: implement initState
    _verifyPhoneNumber();
    super.initState();
  }


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
                        image: AssetImage("assets/images/OTPScreen.png"),
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
              "OTP Verification",
              style: TextStyle(
                  color: Color(0xff897A5F),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter OTP Sent to" + widget.phoneNumber,
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 6,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) async {
                try {
                  await FirebaseAuth.instance
                      .signInWithCredential(PhoneAuthProvider.credential(
                          verificationId: _verificationCode,
                          smsCode: verificationCode))
                      .then((value) async {
                    if (value.user != null) {
                      CheckUser();
                      // Navigator.pushReplacement(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => SelectLocation()));
                    }
                  });
                } catch (e) {
                  FocusScope.of(context).unfocus();
                  _scaffoldkey.currentState!
                      .showSnackBar(SnackBar(content: Text("Invalid Code")));
                }
              }, // end onSubmit
            ),
          ],
        ),
      ),
    );
  }

  _verifyPhoneNumber() async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: widget.phoneNumber,
      verificationCompleted: (PhoneAuthCredential ceredentials) async {
        await FirebaseAuth.instance
            .signInWithCredential(ceredentials)
            .then((value) async {
          if (value.user != null) {
            CheckUser();
            // Navigator.pushReplacement(context,
            //     MaterialPageRoute(builder: (context) => SelectLocation()));
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verificationId, int? resendToken) {
        setState(() {
          _verificationCode = verificationId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }
}
