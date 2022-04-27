import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/ConfirmOrder.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class Inclusion extends StatefulWidget {
  String name;
  String location;
  String location2;
  String date;
  int Price;
  String slot;

  Inclusion(
      {required this.Price,
      required this.date,
      required this.location,
      required this.location2,
      required this.name,
      required this.slot});
  @override
  _InclusionState createState() => _InclusionState();
}

class _InclusionState extends State<Inclusion> {
  int Selected_Index=0;
  @override
  Widget build(BuildContext context) {
    // Here, default theme colors are used for activeBgColor, activeFgColor, inactiveBgColor and inactiveFgColor

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                    ToggleSwitch(
                      activeBgColor: [Colors.indigo],
                      minWidth: 200,
                    initialLabelIndex: Selected_Index,
                    totalSwitches: 2,
                    labels: ['Inclusive', 'Exclusive'],
                    onToggle: (index) {
                      setState(() {
                        Selected_Index=index!;
                      });
                    },
                  )
                    ],
                  ),
                ),
              ),
              Selected_Index==0?Column(
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.6,
                    color: Colors.black,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.arrow_right,
                                color: Colors.white,
                                size: 50,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.8,
                                child: Text(
                                    "Prices Shown are for Labour Charges Only",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ):Column(
                children: [
                  Container(
                    //height: MediaQuery.of(context).size.height*0.65,
                    width: double.infinity,
                    color: Colors.black,
                     child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 50,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                                "Prices Shown are for Labour Charges Only",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),

                  ),

                  Container(color: Colors.black,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_right,
                            color: Colors.white,
                            size: 50,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Text(
                                "Prices Shown are for Labour Charges Only",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white)),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                color: Colors.white,
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: FittedBox(
                              child: Text("Payable Amount",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            ),
                          ),
                          FittedBox(
                            child: Text(
                                    Constants.price!,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black)),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.indigo,
                        child: FlatButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ConfirmOrder(
                                          name: widget.name,
                                          location: widget.location,
                                          location2: widget.location2,
                                          date: widget.date,
                                          Price: widget.Price,
                                          slot: widget.slot)));
                            },
                            child: FittedBox(
                              child: Text("Make Payment",
                                  style: TextStyle(
                                      fontSize: 20,
                                      // fontWeight: FontWeight.w500,
                                      color: Colors.black)),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
