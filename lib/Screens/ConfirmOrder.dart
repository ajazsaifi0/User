import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../Services/Api.dart';

class ConfirmOrder extends StatefulWidget {
  String name;
  String location;
  String location2;
  String date;
  int Price;
  String slot;

  ConfirmOrder(
      {required this.Price,
      required this.date,
      required this.location,
      required this.location2,
      required this.name,
      required this.slot});

  @override
  _ConfirmOrderState createState() => _ConfirmOrderState();
}

TextEditingController coupon = new TextEditingController();

class _ConfirmOrderState extends State<ConfirmOrder> {
  late Razorpay _razorpay;
  void handlePaymentSuccess(PaymentSuccessResponse response) {
    UploadBookingData("online", "paid");
    print("Payment Sucessful");
    Fluttertoast.showToast(
        msg: "SUCCESS: " + response.paymentId!, timeInSecForIosWeb: 4);
  }

  void handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR: " + response.code.toString() + " - " + response.message!,
        timeInSecForIosWeb: 4);
  }

  void handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET: " + response.walletName!, timeInSecForIosWeb: 4);
  }

  void openCheckout() {
    var options = {
      "key": "rzp_test_bwIcLIC1EVQXtp",
      "amount": int.parse(Constants.price!) * 100,
      "name": "BHS",
      "description": "Pay Securely for your services",
      "prefill": {"contact": Constants.mobile_no, "email": Constants.email},
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
  var api=new Api();
  //Upload Booking Data
  UploadBookingData(String PaymentMethod,String payment_Status) async {
    try {
      var requestBody = {
        "name": widget.name,
        "user_id": Constants.Id,
        "vendor_id":"1",
        "u_remark": "Booked",
        "service": Constants.Service_Type,
        "service_type": Constants.Sub_Service_Type,
        "slot": widget.slot,
        "location":widget.location+widget.location2,
        "payment_method": PaymentMethod,
        "status": payment_Status,
        "price":widget.Price.toString(),
        "plus_member": "NO",
        "date": widget.date,
        "quantity":selectedValue,
        "mobile_no":Constants.mobile_no
      };
      dynamic response = await api.ApiCallingWithRequestBody(
          "/user/booking.php", requestBody);
      if (response != [] && response != null) {
        if (response["MESSAGE"] == "UPLOAD SUCEED") {
          Fluttertoast.showToast(msg: "Booking Sucessfull");
          Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) =>
                  HomeScreen(widget.location, widget.location2)));
        } else {
          Fluttertoast.showToast(msg: response["MESSAGE"]);
        }
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  String? selectedValue;
  List<String> items = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
  ];
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
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: FittedBox(
                          child: Text("Apply Coupon",
                              style: TextStyle(fontSize: 22))),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: coupon,
                          decoration: const InputDecoration(
                            hintText: "Enter Coupon Code Here",
                            // labelText: "Enter Coupon Code Here",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                height: 60,
                // color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Total Payable:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                    ),
                    Text("Rs." + Constants.price.toString(),
                        style: TextStyle(fontSize: 20))
                  ],
                ),
              ),
              Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                color: Colors.indigo,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: Icon(Icons.check_box),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                        child: FittedBox(
                          child: Text(
                            "I am Agree To Term And Condition",
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        child: Text(
                          "Scheduled Date And Time",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Icon(
                        Icons.calendar_today,
                        size: 30,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        widget.date.substring(0, 10),
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 70,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: Icon(
                          Icons.punch_clock,
                          size: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                        child: FittedBox(
                          child: Text(
                            widget.slot,
                            style: TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 5,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Row(children: [
                  Text(
                    "Contact Details :",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Icon(
                        Icons.person,
                        size: 30,
                      ),
                    ),
                    SizedBox(

                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        widget.name == "" ? "ENTER NAME" : widget.name,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Icon(
                        Icons.phone,
                        size: 30,
                      ),
                    ),
                    SizedBox(

                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: Text(
                        Constants.MobileNum,
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(children: [
                  Text(
                    "Address :",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ]),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: FittedBox(
                        child: Text(
                          widget.location + "\n" + widget.location2,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select Quantity',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                    buttonDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: Colors.black26,
                      ),
                      color: Colors.indigo,
                    ),
                    items: items
                        .map((item) =>
                        DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                        Constants.price=(int.parse(selectedValue!)*int.parse(Constants.price.toString())).toString();
                      });
                    },
                    buttonHeight: 40,
                    buttonWidth: MediaQuery.of(context).size.width,
                    itemHeight: 40,

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                          onPressed: () {
                            openCheckout();
                          },
                          child: Text("Pay Online")),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                          onPressed: () {
                            UploadBookingData("offline","not paid");
                          },
                          child: Text("Pay Offline")),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
