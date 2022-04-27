import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/Inclusion.dart';
import 'package:bengal_home_service/Screens/Inclusion.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SlotBooking extends StatefulWidget {
  String name;
  String location;
  String location2;
  SlotBooking(
      {required this.location, required this.location2, required this.name});
  @override
  _SlotBookingState createState() => _SlotBookingState();
}

var _selectedValue;
int Price =0;

class _SlotBookingState extends State<SlotBooking> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      _selectedValue = DateTime.now();
      Price=int.parse(Constants.price!);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.indigo,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.home),
                      Container(
                        width: 120,
                        child: Text(
                          Constants.Address,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Text(
                        "Change",
                        style: TextStyle(color: Colors.blue),
                      )
                    ],
                  ),
                  height: 70,
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Row(
                    children: [
                      Text(
                        "When Would You Like \n Your Services ?",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    DatePicker(
                      DateTime.now(),
                      initialSelectedDate: _selectedValue,
                      selectionColor: Colors.black,
                      selectedTextColor: Colors.white,
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectedValue = date;
                        });
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                         "Rs "+ Constants.price!,
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.w500),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Text(
                      //     //"View Details",
                      //     style: TextStyle(fontSize: 15),
                      //   ),
                      // )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                              onPressed: () {
                                if (_selectedValue != null) {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Inclusion(
                                              name: widget.name,
                                              location: widget.location,
                                              location2: widget.location2,
                                              date: _selectedValue.toString(),
                                              Price: Price,
                                              slot:
                                                  "Morning  9:00 - 12:00pm")));
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "please select a date");
                                }
                              },
                              child: Text(
                                "Morning \n 9:00 - 12:00pm",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inclusion(
                                            name: widget.name,
                                            location: widget.location,
                                            location2: widget.location2,
                                            date: _selectedValue.toString(),
                                            Price: Price,
                                            slot:
                                                "Afternoon  12:00 - 3:00pm")));
                              },
                              child: Text(
                                "Afternoon \n 12:00 - 3:00pm",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inclusion(
                                            name: widget.name,
                                            location: widget.location,
                                            location2: widget.location2,
                                            date: _selectedValue.toString(),
                                            Price: Price,
                                            slot: "Afternoon 3:00 - 6:00pm")));
                              },
                              child: Text(
                                "Afternoon \n 3:00 - 6:00pm",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Inclusion(
                                            name: widget.name,
                                            location: widget.location,
                                            location2: widget.location2,
                                            date: _selectedValue.toString(),
                                            Price: Price,
                                            slot: "Evening  6:00 - 8:00pm")));
                              },
                              child: Text(
                                "Evening \n 6:00 - 8:00pm",
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
