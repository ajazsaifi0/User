import 'package:bengal_home_service/Screens/PaymentSucessful.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class PlusMember extends StatefulWidget {
  const PlusMember({Key? key}) : super(key: key);

  @override
  _PlusMemberState createState() => _PlusMemberState();
}

class _PlusMemberState extends State<PlusMember> {
  List<String> card1 = ["10% off", "₹100 off", "₹50 off"];
  List<String> card2 = ["->Salon &", "-> Appliances", "->Home"];
  List<String> card3 = [
    "Massage",
    "Repairs",
    "Repairs",
  ];
  List<String> card4 = [
    "->Men's",
    "->Cleaning",
    " ",
  ];
  List<String> card5 = [
    "Haircut",
    " ",
    " ",
  ];
  String price = "";
  late Razorpay _razorpay;
  void handlePaymentSuccess() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => PaymentSucessful()));
  }

  void handlePaymentError() {
    Fluttertoast.showToast(msg: "Something Goes Wrong");
  }

  void handleExternalWallet() {
    Fluttertoast.showToast(msg: "Something Goes Wrong");
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_bwIcLIC1EVQXtp",
      "amount": num.parse(price) * 100,
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
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("BHS Plus")),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(),
                // Icon(
                //   Icons.star,
                //   size: 60,
                //   color: Colors.,
                // ),
                Row(
                  children: [
                    Text(
                      "BHS",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "plus",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox()
              ],
            ),
            GridView.count(
                shrinkWrap: true,
                crossAxisCount: 3,
                crossAxisSpacing: 4.0,
                mainAxisSpacing: 8.0,
                children: List.generate(card1.length, (index) {
                  return Center(
                    child: Card(
                      child: Container(
                        color: Colors.grey,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(card1[index]),
                              Text(card2[index]),
                              Text(card3[index]),
                              Text(card4[index]),
                              Text(card5[index])
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                })),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomRadioButton(
                elevation: 0,
                absoluteZeroSpacing: true,
                unSelectedColor: Theme.of(context).canvasColor,
                buttonLables: [
                  "12 Months                                                ₹299",
                  "6 Months                                                 ₹249 ",
                  "No, I will pay ₹948",
                ],
                buttonValues: [
                  299,
                  249,
                  948,
                ],
                buttonTextStyle: ButtonTextStyle(
                    selectedColor: Colors.white,
                    unSelectedColor: Colors.black,
                    textStyle: TextStyle(fontSize: 16)),
                radioButtonValue: (value) {
                  setState(() {
                    price = value.toString();
                  });
                },
                horizontal: true,
                selectedColor: Colors.blue,
                enableShape: true,
                padding: 15,
                margin: EdgeInsets.only(top: 10),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.assistant_rounded,
                  size: 50,
                ),
                SizedBox(
                  width: 5,
                ),
                FittedBox(
                    child: Text(
                  "Upto 100% Money Back Gurantee",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                "If you save less than the membership price we will refund the difference",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              height: 85,
              width: MediaQuery.of(context).size.width,
              color: Colors.grey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "A powerful plan with",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 4,
                    color: Colors.black,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.offline_pin_sharp,
                          size: 20,
                          color: Colors.black,
                        ),
                        Text(
                          "Membership discount of 100 applied",
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  child: Text(
                    "Pay Now",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (price != "") {
                      openCheckout();
                    } else {
                      Fluttertoast.showToast(
                          msg: "Please Select One of the Options");
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
