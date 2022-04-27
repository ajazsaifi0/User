import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PaymentGateway extends StatefulWidget {
  const PaymentGateway({Key? key}) : super(key: key);

  @override
  _PaymentGatewayState createState() => _PaymentGatewayState();
}

class _PaymentGatewayState extends State<PaymentGateway> {
  late Razorpay _razorpay;
  void handlePaymentSuccess() {
    print("Payment Sucessful");
  }

  void handlePaymentError() {
    print("Payment Error");
  }

  void handleExternalWallet() {
    print("External wallet");
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_bwIcLIC1EVQXtp",
      "amount": 350 * 100,
      "name": "BHS",
      "description": "Pay Securely for your services",
      "prefill": {"contact": "123456789", "email": 'test@razorpay.com'},
      "external": {
        "wallets": ["paytm"]
      }
    };
    try {
      _razorpay.open(options);
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    _razorpay = new Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _razorpay.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              openCheckout();
            },
            child: Text("Pay Now"),
          ),
        )
      ],
    );
  }
}
