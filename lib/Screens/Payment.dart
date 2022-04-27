import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Payment Option")),
      ),
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
        Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FittedBox(
                child: Text(
                  "Online Payment",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ))
          ],
        ),
      ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Credit and Debit Card",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Container(height: 19,),
              Text(
                "Offline Payment",
                style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Cash On Delivery",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 17),
                ),
              ),
      ]
    )



    )
    );
  }
}
