import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/PlusScreenAfterCart.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';

class ConfirmServices extends StatefulWidget {
  String servicetype;
  String Image1;
  String Image2;
  String Image3;
  String ProductType1;
  String ProductType2;
  ConfirmServices(
      {required this.servicetype,
      required this.Image1,
      required this.Image2,
      required this.Image3,
      required this.ProductType1,
      required this.ProductType2});
  @override
  _ConfirmServicesState createState() => _ConfirmServicesState();
}

var radioButtonItem;
var id;
var id1;
var id2;
String? price;
String? Service_Type;
String? Sub_Service_Type;
//list of categories
List<String> ac_Service1=[
  "Inspect charge: ₹300",
  "Dry Service : ₹500",
  "Water Service : ₹600"
];
List<String> ac_Service2=[
  "JetPump Service:₹900",
  "Pump Service : ₹1200",
];
List<String> ac_Service3=[
  "Install Charge: ₹1200",
  "Uninstall Charge : ₹800",
];
//refrigerator
List<String> Ref_Service1=[
  "Inspect charge: ₹300",
  "Inspect charge(S/S): ₹500",
  "Install with demo: ₹600"
];
List<String> Ref_Service2=[
  "Single door Service: ₹600",
  "Single door vinegar/shampoo service: ₹800",
  "Single door chemical service: ₹1000",
  "double door Service: ₹700",
  "double door vinegar/shampoo service: ₹1100",
  "double door chemical service: ₹1200",
];
List<String> Ref_Service3=[
  "Triple door Service: ₹800",
  "Triple door Vinegar Service: ₹1100",
  "Triple door Chemical Service:₹1300",
  "S/S Service: ₹1000",
  "S/S Vinegar Service: ₹1200",
  "S/S Chemical Service: ₹1500"
];
//washing Machine
List<String> Washing_Service1=[
  "Inspect charge: ₹300",
  "Install with demo(Top load): ₹500",
  "Install with demo(Front load): ₹600"
];
List<String> Washing_Service2=[
  "Water Service(Front load): ₹1050",
  "Chemical Service(Front load): ₹1200",
  "Water Service(Top load): ₹850",
  "Chemical Service(Top load): ₹1000"
];
List<String> Washing_Service3=[
  "Water Service(Semi Automatic): ₹600",
  "Chemical Service(Semi Automatic): ₹800",
];
//microwave
List<String> Microwave_Service1=[
  "Inspect charge: ₹300",
  "Service charge: ₹600",
  "Install with demo: ₹500"
];
//geyser
List<String> Geyser_Service1=[
  "Inspection charge: ₹300",
  "Service charge(upto 10L): ₹600",
  "Service charge(upto 20L): ₹800",
  "Install with Demo(upto 10L): ₹500",
  "Install with Demo(above 10L): ₹599",
];
//Chimney
List<String> Chimney_Service1=[
  "Inspection charge: ₹300",
  "Service charge: ₹600",
  "Install with Demo: ₹599",
];
//T.V
List<String> TV_Service1=[
  "Inspection charge: ₹300",
  "Service charge: ₹600",
  "Install with Demo(42 inch): ₹500",
  "Install with Demo(42 above): ₹750",
];
//RO
List<String> RO_Service1=[
  "Inspection charge: ₹300",
  "Service charge: ₹400",
  "Install Charge: ₹500"
];
//desktop
List<String> Desktop_Service1=[
  "Inspection charge: ₹300",
  "Service charge: ₹400",
];
//Lift Repair
List<String> Lift_Repair1=[
  "Inspection charge: ₹300",
  "Service charge: ₹1200",
];
class _ConfirmServicesState extends State<ConfirmServices> {
  @override
  void initState() {
    setState(() {
      Service_Type=widget.servicetype;
      Constants.Service_Type=Service_Type;
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.servicetype,
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                children: [
                  Text(
                    widget.servicetype,
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.w500),
                  ),
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

            //service
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/" + widget.Image1,
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Service"),
                    )
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height*0.2,
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        //for Ac
                        child: widget.servicetype.contains("Air")?CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: [
                            "Inspect charge: ₹300",
                            "Dry Service : ₹500",
                            "Water Service : ₹600"
                          ],
                          buttonValues: [
                            300,
                            500,
                            600,
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<ac_Service1.length;i++){
                                if(ac_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=ac_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 15,
                          margin: EdgeInsets.only(top: 10),
                        ):widget.servicetype.contains("Refrigerator")?CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: [
                            "Inspect charge: ₹300",
                            "Inspect charge(S/S):₹500",
                            "Install with demo: ₹600"
                          ],
                          buttonValues: [
                            300,
                            500,
                            600,
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Ref_Service1.length;i++){
                                if(Ref_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=Ref_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 15,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Washing")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: [
                            "Inspect charge: ₹300",
                            "Install with demo(Top load): ₹500",
                            "Install with demo(Front load): ₹600"
                          ],
                          buttonValues: [
                            300,
                            500,
                            600,
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Washing_Service1.length;i++){
                                if(Washing_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=Washing_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Microwave")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: Microwave_Service1,
                          buttonValues: [
                            300,
                            600,
                            500,
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Microwave_Service1.length;i++){
                                if(Microwave_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=Microwave_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Geyser")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: Geyser_Service1,
                          buttonValues: [
                            300,
                            600,
                            800,
                            500,
                            699
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Geyser_Service1.length;i++){
                                if(Geyser_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=Geyser_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Chimney")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: Chimney_Service1,
                          buttonValues: [
                            300,
                            600,
                            599
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Chimney_Service1.length;i++){
                                if(Chimney_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=Chimney_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Telev")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: TV_Service1,
                          buttonValues: [
                            300,
                            600,
                            500,
                            750
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<TV_Service1.length;i++){
                                if(TV_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=TV_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Water")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: RO_Service1,
                          buttonValues: [
                            300,
                            400,
                            500
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<RO_Service1.length;i++){
                                if(RO_Service1[i].contains(value.toString())){
                                  Sub_Service_Type=RO_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Desktop")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: RO_Service1,
                          buttonValues: [
                            300,
                            400,
                            500
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Desktop_Service1.length;i++){
                                if(Desktop_Service1.contains(value.toString())){
                                  Sub_Service_Type=Desktop_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        ):
                        widget.servicetype.contains("Lift")?
                        CustomRadioButton(
                          elevation: 0,
                          absoluteZeroSpacing: true,
                          unSelectedColor: Theme.of(context).canvasColor,
                          buttonLables: Lift_Repair1,
                          buttonValues: [
                            300,
                           1200
                          ],
                          buttonTextStyle: ButtonTextStyle(
                              selectedColor: Colors.white,
                              unSelectedColor: Colors.black,
                              textStyle: TextStyle(fontSize: 13)),
                          radioButtonValue: (value) {
                            setState(() {
                              // price = value.toString();
                              price=value.toString();
                              for(int i=0;i<Desktop_Service1.length;i++){
                                if(Desktop_Service1.contains(value.toString())){
                                  Sub_Service_Type=Desktop_Service1[i];
                                  Constants.Sub_Service_Type=Sub_Service_Type;
                                }
                              }
                              print(Sub_Service_Type);

                            });
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 10,
                          margin: EdgeInsets.only(top: 10),
                        )
                            :
                        CustomRadioButton(
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
                              // price = value.toString();
                            });
                          },
                          horizontal: true,
                          selectedColor: Colors.blue,
                          enableShape: true,
                          padding: 15,
                          margin: EdgeInsets.only(top: 10),
                        ),
                      ),
                    ),
                  ],
                ),

              ],
            ),
            Container(
              height: 1,
              color: Colors.black,
            ),



            //repair


            widget.servicetype!="Lift Repair"&& widget.servicetype!="Desktop"&& widget.servicetype!="Microwave"&&widget.servicetype!="Geyser"&&widget.servicetype!="Chimney"&&widget.servicetype!="Television"&&widget.servicetype!="Water Purifier"?Padding(
              padding: const EdgeInsets.all(0.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        "assets/images/" + widget.Image2,
                        height: 100,
                        width: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Repair"),
                      )
                    ],
                  ),
                  Column(
                    children: [
                      Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Column(
                              children: [

                                Container(
                                  height: MediaQuery.of(context).size.height*0.25,
                                  width: MediaQuery.of(context).size.width*0.7,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    //for Ac
                                    child: widget.servicetype.contains("Air")?CustomRadioButton(
                                      elevation: 0,
                                      absoluteZeroSpacing: true,
                                      unSelectedColor: Theme.of(context).canvasColor,
                                      buttonLables: [
                                        "JetPump Service:₹900",
                                        "Pump Service : ₹1200",

                                      ],
                                      buttonValues: [
                                        900,
                                        1200,

                                      ],
                                      buttonTextStyle: ButtonTextStyle(
                                          selectedColor: Colors.white,
                                          unSelectedColor: Colors.black,
                                          textStyle: TextStyle(fontSize: 13)),
                                      radioButtonValue: (value) {
                                        setState(() {
                                          // price = value.toString();
                                          price=value.toString();
                                          for(int i=0;i<ac_Service2.length;i++){
                                            if(ac_Service2[i].contains(value.toString())){
                                              Sub_Service_Type=ac_Service2[i];
                                              Constants.Sub_Service_Type=Sub_Service_Type;
                                            }
                                          }
                                          print(Sub_Service_Type);
                                        });
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                      },
                                      horizontal: true,
                                      selectedColor: Colors.blue,
                                      enableShape: true,
                                      padding: 15,
                                      margin: EdgeInsets.only(top: 10),
                                    ):
                                    widget.servicetype.contains("Refri")?CustomRadioButton(
                                      elevation: 0,
                                      absoluteZeroSpacing: true,
                                      unSelectedColor: Theme.of(context).canvasColor,
                                      buttonLables: [
                                        "Single door Service: ₹600",
                                        "Single door vinegar/shampoo service: ₹800",
                                        "Single door chemical service: ₹1000",
                                        "double door Service: ₹700",
                                        "double door vinegar/shampoo service: ₹1100",
                                        "double door chemical service: ₹1200",
                                      ],
                                      buttonValues: [
                                        600,
                                        800,
                                        1000,
                                        700,
                                        1100,
                                        1200
                                      ],
                                      buttonTextStyle: ButtonTextStyle(
                                          selectedColor: Colors.white,
                                          unSelectedColor: Colors.black,
                                          textStyle: TextStyle(fontSize: 11)),
                                      radioButtonValue: (value) {
                                        setState(() {
                                          // price = value.toString();
                                          price=value.toString();
                                          for(int i=0;i<Ref_Service2.length;i++){
                                            if(Ref_Service2[i].contains(value.toString())){
                                              Sub_Service_Type=Ref_Service2[i];
                                              Constants.Sub_Service_Type=Sub_Service_Type;
                                            }
                                          }
                                          print(Sub_Service_Type);
                                        });
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                      },
                                      horizontal: true,
                                      selectedColor: Colors.blue,
                                      enableShape: true,
                                      padding: 15,
                                      margin: EdgeInsets.only(top: 10),
                                    ):
                                    widget.servicetype.contains("Washing")?
                                    CustomRadioButton(
                                      elevation: 0,
                                      absoluteZeroSpacing: true,
                                      unSelectedColor: Theme.of(context).canvasColor,
                                      buttonLables: [
                                        "Water Service(Front load): ₹1050",
                                        "Chemical Service(Front load): ₹1200",
                                        "Water Service(Top load): ₹850",
                                        "Chemical Service(Top load): ₹1000"
                                      ],
                                      buttonValues: [
                                        1050,
                                        1200,
                                        850,
                                        1000,
                                      ],
                                      buttonTextStyle: ButtonTextStyle(
                                          selectedColor: Colors.white,
                                          unSelectedColor: Colors.black,
                                          textStyle: TextStyle(fontSize: 11)),
                                      radioButtonValue: (value) {
                                        setState(() {
                                          // price = value.toString();
                                          price=value.toString();
                                          for(int i=0;i<Washing_Service2.length;i++){
                                            if(Washing_Service2[i].contains(value.toString())){
                                              Sub_Service_Type=Washing_Service2[i];
                                              Constants.Sub_Service_Type=Sub_Service_Type;
                                            }
                                          }
                                          print(Sub_Service_Type);
                                        });
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                      },
                                      horizontal: true,
                                      selectedColor: Colors.blue,
                                      enableShape: true,
                                      padding: 15,
                                      margin: EdgeInsets.only(top: 10),
                                    )
                                        :
                                    CustomRadioButton(
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
                                          // price = value.toString();
                                        });
                                      },
                                      horizontal: true,
                                      selectedColor: Colors.blue,
                                      enableShape: true,
                                      padding: 15,
                                      margin: EdgeInsets.only(top: 10),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ]),
                    ],
                  )
                ],
              ),
            ):Container(),
            Container(
              height: 1,
              color: Colors.black,
            ),
            widget.servicetype!="Lift Repair"&&widget.servicetype!="Desktop"&& widget.servicetype!="Microwave"&&widget.servicetype!="Geyser"&&widget.servicetype!="Chimney"&&widget.servicetype!="Television"&&widget.servicetype!="Water Purifier"? Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Image.asset(
                      "assets/images/" + widget.Image3,
                      height: 100,
                      width: 100,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: Text(widget.servicetype.contains("Refri")?"Triple & S/S":widget.servicetype.contains("Washing")?"Semi Automatic":"Installation and \n Uninstallation"),
                    )
                  ],
                ),
                Column(
                  children: [
                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height*0.3,
                                width: MediaQuery.of(context).size.width*0.7,
                                child: Padding(
                                  padding: const EdgeInsets.all(0.0),
                                  //for Ac
                                  child: widget.servicetype.contains("Air")?CustomRadioButton(
                                    elevation: 0,
                                    absoluteZeroSpacing: true,
                                    unSelectedColor: Theme.of(context).canvasColor,
                                    buttonLables: [
                                      "Install Charge: ₹1200",
                                      "Uninstall Charge : ₹800",

                                    ],
                                    buttonValues: [
                                      1200,
                                      800,

                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 13)),
                                    radioButtonValue: (value) {
                                      setState(() {
                                         price = value.toString();
                                         for(int i=0;i<ac_Service3.length;i++){
                                           if(ac_Service3[i].contains(value.toString())){
                                             Sub_Service_Type=ac_Service3[i];
                                             Constants.Sub_Service_Type=Sub_Service_Type;
                                           }
                                         }
                                         print(Sub_Service_Type);
                                      });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                    },
                                    horizontal: true,
                                    selectedColor: Colors.blue,
                                    enableShape: true,
                                    padding: 15,
                                    margin: EdgeInsets.only(top: 10),
                                  ):
                                  widget.servicetype.contains("Refri")?CustomRadioButton(
                                    elevation: 0,
                                    absoluteZeroSpacing: true,
                                    unSelectedColor: Theme.of(context).canvasColor,
                                    buttonLables: [
                                      "Triple door Service: ₹800",
                                      "Triple door Vinegar Service: ₹1100",
                                      "Triple door Chemical Service:₹1300",
                                      "S/S Service: ₹1000",
                                      "S/S Vinegar Service: ₹1200",
                                      "S/S Chemical Service: ₹1500"
                                    ],
                                    buttonValues: [
                                      800,
                                      1100,
                                      1300,
                                      1000,
                                      1200,
                                      1500
                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 11)),
                                    radioButtonValue: (value) {
                                      setState(() {
                                        price = value.toString();
                                        for(int i=0;i<Ref_Service3.length;i++){
                                          if(Ref_Service3[i].contains(value.toString())){
                                            Sub_Service_Type=Ref_Service3[i];
                                            Constants.Sub_Service_Type=Sub_Service_Type;
                                          }
                                        }
                                        print(Sub_Service_Type);
                                      });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                    },
                                    horizontal: true,
                                    selectedColor: Colors.blue,
                                    enableShape: true,
                                    padding: 15,
                                    margin: EdgeInsets.only(top: 10),
                                  ):
                                  widget.servicetype.contains("Washing")?
                                  CustomRadioButton(
                                    elevation: 0,
                                    absoluteZeroSpacing: true,
                                    unSelectedColor: Theme.of(context).canvasColor,
                                    buttonLables: [
                                      "Water Service(Semi Automatic): ₹600",
                                      "Chemical Service(Semi Automatic): ₹800",
                                    ],
                                    buttonValues: [
                                     600,
                                      800
                                    ],
                                    buttonTextStyle: ButtonTextStyle(
                                        selectedColor: Colors.white,
                                        unSelectedColor: Colors.black,
                                        textStyle: TextStyle(fontSize: 11)),
                                    radioButtonValue: (value) {
                                      setState(() {
                                        price = value.toString();
                                        for(int i=0;i<Washing_Service3.length;i++){
                                          if(Washing_Service3[i].contains(value.toString())){
                                            Sub_Service_Type=Washing_Service3[i];
                                            Constants.Sub_Service_Type=Sub_Service_Type;
                                          }
                                        }
                                        print(Sub_Service_Type);
                                      });
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));

                                    },
                                    horizontal: true,
                                    selectedColor: Colors.blue,
                                    enableShape: true,
                                    padding: 15,
                                    margin: EdgeInsets.only(top: 10),
                                  )
                                      :
                                  CustomRadioButton(
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
                                        // price = value.toString();
                                      });
                                    },
                                    horizontal: true,
                                    selectedColor: Colors.blue,
                                    enableShape: true,
                                    padding: 15,
                                    margin: EdgeInsets.only(top: 10),
                                  )
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ],
                )
              ],
            ):Container()
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => PlusScreenAfterCart(price)));
            //   },
            //   child: Text("Submit"),
            // )
          ],
        )),
      ),
    );
  }


}
