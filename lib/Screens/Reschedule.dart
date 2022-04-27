import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Constants.dart';
import '../Services/Api.dart';
import 'BookingDetailScreen.dart';
import 'BookingHistory.dart';
import 'OnBoardScreen.dart';

class Reschedule extends StatefulWidget {
  String? Job_Id;
  Reschedule(this.Job_Id);

  @override
  _RescheduleState createState() => _RescheduleState();
}

class _RescheduleState extends State<Reschedule> {
  var _selectedValue;
  var api=new Api();
  RescheduleBooking(slot)async{
    //https://bengalhomeservices.com/user/reschedule.php
    var requestBody={
      "slot":slot,
      "date":_selectedValue.toString(),
      "Id":widget.Job_Id
    };
    dynamic res=await api.ApiCallingWithRequestBody("/user/reschedule.php", requestBody);
    if(res["MESSAGE"]=="UPLOAD SUCEED"){
      print("job Reschedule");
      Navigator.push(context, MaterialPageRoute(builder: (context)=>BookingHistory()));
      Fluttertoast.showToast(msg: res["MESSAGE"]);
    }else{
      Fluttertoast.showToast(msg: res["MESSAGE"]);
    }
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
          ),Column(
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
          ),Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 1,
              color: Colors.black,
            ),
          ),Column(
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
                           RescheduleBooking("Morning  9:00 - 12:00pm");
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
                         RescheduleBooking( "Afternoon  12:00 - 3:00pm");
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
                          RescheduleBooking("Afternoon 3:00 - 6:00pm");
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
                         RescheduleBooking("Evening  6:00 - 8:00pm");
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
          )])
       ]
    )
    )
    );
  }
}
