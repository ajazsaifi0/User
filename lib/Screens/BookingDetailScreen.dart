import 'package:bengal_home_service/Screens/BookingHistory.dart';
import 'package:bengal_home_service/Services/Api.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'Reschedule.dart';
class BookingDetail extends StatefulWidget {
 String? name;
 String? service;
 String? service_type;
 String? u_remark;
 String? v_remark;
 String? location;
 String? slot;
 String? date;
 String? payment_method;
 String? price;
 String? status;
 String? plus_member;
 String? vendor_id;
 String? mobile_no;
 String? quantity;
 String? Job_Id;
 BookingDetail(this.name,this.service,this.service_type,this.u_remark,this.v_remark,this.location,
     this.slot,this.date,this.payment_method,this.price,this.status,this.plus_member,this.vendor_id,
     this.mobile_no,this.quantity,this.Job_Id);


  @override
  _BookingDetailState createState() => _BookingDetailState();
}

class _BookingDetailState extends State<BookingDetail> {
  var api=new Api();
  CancelBooking()async{
    //https://bengalhomeservices.com/user/cancel.php
    var requestBody={
    "u_remark":"Cancelled",
    "Id":widget.Job_Id
    };
    dynamic res=await api.ApiCallingWithRequestBody("/user/cancel.php", requestBody);
    if(res["MESSAGE"]=="UPLOAD SUCEED"){
      print("job Cancelled");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BookingHistory()));

    }else{
      Fluttertoast.showToast(msg: res["MESSAGE"]);
    }
  }
  @override
  void initState() {
    // TODO: implement initState
    print(widget.Job_Id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Booking Summary",style: TextStyle(color: Colors.black),),
        elevation: 5,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Column(
                    children: [
                      Text(widget.name.toString(),style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Icon(Icons.calendar_today_rounded,color: Colors.grey,),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(widget.slot.toString()+"\n            "+widget.date.toString().substring(0,11)),
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Service",style: TextStyle(fontWeight: FontWeight.bold),),
                      ),
                      Text(widget.service.toString())
                    ],
                  ),
                  widget.v_remark!="Completed"&&widget.u_remark!="Cancelled"?ElevatedButton(onPressed: (){
                    CancelBooking();
                  }, child: Text("Cancel Booking")):Container(),
                  widget.v_remark!="Completed"&&widget.u_remark!="Cancelled"?ElevatedButton(onPressed: (){
                   // CancelBooking();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Reschedule(widget.Job_Id)));

                  }, child: Text("Reschedule"),
                  ):Container()
                ],
              ),
            ),
            SizedBox(
              height: 10,
              child: Container(
                color: Colors.grey[200],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.location_on_sharp,size: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("Location",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                            ],
                          ),
                        ),
                        FittedBox(child: Text(widget.location.toString(),style: TextStyle(fontSize: 16),))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.calendar_today_rounded,size: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Booking Date",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                          ],
                        ),
                        Text(widget.date.toString().substring(0,11),style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.timelapse,size: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Booking Time",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                          ],
                        ),
                        Text(widget.slot.toString(),style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.credit_card_outlined,size: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Amount Paid",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                          ],
                        ),
                        Text(widget.price.toString(),style: TextStyle(fontSize: 25,color: Colors.indigo,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Icon(Icons.credit_card_outlined,size: 40,),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Payment Type",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
                          ],
                        ),
                        Text(widget.payment_method.toString(),style: TextStyle(fontSize: 18),),

                      ],
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.cleaning_services,size: 30,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Service Type",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                              ],
                            ),
                            Text(widget.service_type.toString().substring(0,widget.service_type.toString().length-6),style: TextStyle(fontSize: 16),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.car_repair,size: 30,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text("Booking Status",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 18),),
                              ],
                            ),
                            Text(widget.u_remark.toString(),style: TextStyle(fontSize: 16),),

                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),



          ],
        ),
      ),
    );
  }
}

