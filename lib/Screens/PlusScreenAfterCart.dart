import 'package:bengal_home_service/Constants.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf/pdf.dart';

import 'GetLocation.dart';
class PlusScreenAfterCart extends StatefulWidget {
 String? price;
 PlusScreenAfterCart(this.price);

  @override
  _PlusScreenAfterCartState createState() => _PlusScreenAfterCartState();
}

class _PlusScreenAfterCartState extends State<PlusScreenAfterCart> {
  List<String> card1 = ["10% off", "₹50 off"];
  List<String> card2 = ["->Salon &", "->Home"];
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
  String? price;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,
        title: Center(child: Text("BHS Plus")),
          actions: [TextButton(onPressed: (){
            setState(() {
              Constants.price=widget.price.toString();
              debugPrint(Constants.price);
            });
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ServiceLocation()));
          }, child: Text("Skip",style: TextStyle(color: Colors.white)),)],
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
                        color: Colors.white,
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
              child: CustomRadioButton(unSelectedBorderColor: Colors.indigo,
                elevation: 0,
                absoluteZeroSpacing: true,
                selectedColor: Colors.indigo,
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
              color: Colors.white,
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
                child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
    child: Text(
                    "Add",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (price != null) {
                      setState(() {
                        Constants.price=(int.parse(widget.price.toString())+int.parse(price.toString())).toString();
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ServiceLocation()));
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
