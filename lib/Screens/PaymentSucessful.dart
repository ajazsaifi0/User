import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:bengal_home_service/Screens/PlusMemberScreen.dart';
import 'package:flutter/material.dart';

class PaymentSucessful extends StatefulWidget {
  const PaymentSucessful({Key? key}) : super(key: key);

  @override
  _PaymentSucessfulState createState() => _PaymentSucessfulState();
}

class _PaymentSucessfulState extends State<PaymentSucessful> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Payment Sucessful",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Image.asset("assets/images/paymentSucessful.png"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PlusMember()));
              },
              child: Text("Back To Home"))
        ],
      ),
    );
  }
}
