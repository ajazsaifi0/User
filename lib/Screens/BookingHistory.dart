import 'dart:developer';

import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/BookingDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../Services/Api.dart';

class BookingHistory extends StatefulWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  _BookingHistoryState createState() => _BookingHistoryState();
}

class _BookingHistoryState extends State<BookingHistory> {
  int _selectedTab = 1;
  var api=new Api();
  List<String> name=[];
  List<String> service=[];
  List<String> service_type=[];
  List<String> u_remark=[];
  List<String> v_remark=[];
  List<String> location=[];
  List<String> slot=[];
  List<String> date=[];
  List<String> payment_method=[];
  List<String> price=[];
  List<String> status=[];
  List<String> plus_member=[];
  List<String> vendor_id=[];
  List<String> mobile_no=[];
  List<String> quantity=[];
  List<String> Job_Id=[];
//  get booking details
  getbookingDetails()async{
    var requestBody={
      "user_id":Constants.Id
    };
    dynamic res=await api.ApiCallingWithRequestBody("/common/booking_data.php", requestBody);
    if(res["message"]=="exist"){
      for(int i=0;i<res["data"].length;i++){
        setState(() {
          name.add(res["data"][i]["name"]);
          service.add(res["data"][i]["service"]);
          service_type.add(res["data"][i]["service_type"]);
          u_remark.add(res["data"][i]["u_remark"]);
          v_remark.add(res["data"][i]["v_remark"]);
          location.add(res["data"][i]["location"]);
          slot.add(res["data"][i]["slot"]);
          date.add(res["data"][i]["date"]);
          payment_method.add(res["data"][i]["payment_method"]);
         price.add(res["data"][i]["price"]);
          status.add(res["data"][i]["status"]);
          plus_member.add(res["data"][i]["plus_member"]);
          vendor_id.add(res["data"][i]["vendor_id"]);
          mobile_no.add(res["data"][i]["mobile_no"]);
          quantity.add(res["data"][i]["quantity"]);
          Job_Id.add(res["data"][i]["Id"]);
        });
        print(name[i]);

      }
    }else{
      Fluttertoast.showToast(msg: "No Bookings");
    }
  }
@override
  void initState() {
    // TODO: implement initState
    getbookingDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("All Bookings")),
        actions: [Icon(Icons.add_alert)],
      ),
      body: SingleChildScrollView(
        child: name!=[]?Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurpleAccent),
                          onPressed: () {
                            setState(() {
                              _selectedTab = 1;
                            });
                          },
                          child: Text("Ongoing"))),
                  Expanded(
                      child: ElevatedButton(
                          style:
                              ElevatedButton.styleFrom(primary: Colors.purple),
                          onPressed: () {
                            setState(() {
                              _selectedTab = 2;
                            });
                          },
                          child: Text("Completed"))),
                  Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(primary: Colors.pink),
                          onPressed: () {
                            setState(() {
                              _selectedTab = 3;
                            });
                          },
                          child: Text("Cancelled"))),
                ],
              ),
            ),
            _selectedTab == 1
                ? ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: name.length,
                    itemBuilder: (context, position) {
                      return name!=[]&&v_remark[position]!="Completed"&&u_remark[position]!="Cancelled"? GestureDetector(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 180,
                            width: MediaQuery.of(context).size.width,
                            //  color: Colors.black,
                            child: Column(
                              children: [
                                Container(
                                  height: 4,
                                  color: Colors.black,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, top: 8),
                                        child: Icon(
                                          Icons.perm_contact_cal_outlined,
                                          size: 70,
                                        ),
                                      ),
                                      Column(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 15),
                                            child: Text(
                                             name[position],
                                              style: TextStyle(
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 0),
                                            child: Row(
                                              children: [
                                                Icon(Icons.phone),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  Constants.mobile_no,
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 25),
                                            child: Row(
                                              children: [
                                                Icon(Icons.calendar_today),
                                                SizedBox(
                                                  width: 25,
                                                ),
                                                Text(
                                                  slot[position]+"\n            "+date[position].substring(0,11),
                                                  style: TextStyle(
                                                    fontSize: 15,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 3,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 50,
                                        child: Column(
                                          children: [
                                            Text(
                                              "Service",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(service[position])
                                          ],
                                        ),
                                      ),
                                      Text(
                                        u_remark[position],
                                        style: TextStyle(
                                            color: Colors.green,
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) =>
                                  BookingDetail(
                                    name[position],service[position],service_type[position],u_remark[position],
                                    v_remark[position],location[position],slot[position],date[position],payment_method[position],
                                    price[position],status[position],plus_member[position],vendor_id[position],mobile_no[position],
                                    quantity[position],Job_Id[position]
                                  )));
                        },
                      ):Container();
                    })
                : _selectedTab == 2
                    ? ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (context, position) {
                  return name!=[]&&v_remark[position]=="Completed"? GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        //  color: Colors.black,
                        child: Column(
                          children: [
                            Container(
                              height: 4,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 8),
                                    child: Icon(
                                      Icons.perm_contact_cal_outlined,
                                      size: 70,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 15),
                                        child: Text(
                                          name[position],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.phone),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              Constants.mobile_no,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 25),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              slot[position]+"\n            "+date[position].substring(0,11),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Service",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(service[position])
                                      ],
                                    ),
                                  ),
                                  Text(
                                    v_remark[position],
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              BookingDetail(
                                  name[position],service[position],service_type[position],u_remark[position],
                                  v_remark[position],location[position],slot[position],date[position],payment_method[position],
                                  price[position],status[position],plus_member[position],vendor_id[position],mobile_no[position],
                                  quantity[position],Job_Id[position]
                              )));
                    },
                  ):Container();
                })
                    : ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: name.length,
                itemBuilder: (context, position) {
                  return name!=[]&&u_remark[position]=="Cancelled"? GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180,
                        width: MediaQuery.of(context).size.width,
                        //  color: Colors.black,
                        child: Column(
                          children: [
                            Container(
                              height: 4,
                              color: Colors.black,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 8),
                                    child: Icon(
                                      Icons.perm_contact_cal_outlined,
                                      size: 70,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 15),
                                        child: Text(
                                          name[position],
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 0),
                                        child: Row(
                                          children: [
                                            Icon(Icons.phone),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              Constants.mobile_no,
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 25),
                                        child: Row(
                                          children: [
                                            Icon(Icons.calendar_today),
                                            SizedBox(
                                              width: 25,
                                            ),
                                            Text(
                                              slot[position]+"\n            "+date[position].substring(0,11),
                                              style: TextStyle(
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                            Container(
                              height: 3,
                              width: MediaQuery.of(context).size.width,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: 50,
                                    child: Column(
                                      children: [
                                        Text(
                                          "Service",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(service[position])
                                      ],
                                    ),
                                  ),
                                  Text(
                                    u_remark[position],
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) =>
                              BookingDetail(
                                  name[position],service[position],service_type[position],u_remark[position],
                                  v_remark[position],location[position],slot[position],date[position],payment_method[position],
                                  price[position],status[position],plus_member[position],vendor_id[position],mobile_no[position],
                                  quantity[position],Job_Id[position]
                              )));
                    },
                  ):Container();
                })
          ],
        ):Center(child: CircularProgressIndicator(color: Colors.blue))
      ),
    );
  }
}
