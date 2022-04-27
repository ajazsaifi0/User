import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'ConfirmService.dart';

class SafteyPage extends StatefulWidget {
  @override
  _SafteyPageState createState() => _SafteyPageState();
}

class _SafteyPageState extends State<SafteyPage> {
  List<String> profileCards = [
    "About Us",
    "Contact Us",
    "Send a Picture",
    "Comoplain / Suggestion",
  ];
  List<String> profileCardsSub = [
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "Contact Us",
    "Send a Picture",
    "Comoplain / Suggestion",
  ];

  List<IconData> profileCardsLeading = [
    Icons.info,
    Icons.phone,
    Icons.message,
    Icons.message,
  ];

  Widget safteyList(String title, String subTitle, Icon icon) {
    return Container(
      height: 300,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            icon,
            Text(
              title,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            Text(subTitle, style: TextStyle(color: Colors.black, fontSize: 15)),
            SizedBox(
              height: 12,
              width: MediaQuery.of(context).size.width * 0.9,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> services = [
    "Air Conditioner ",
    "Refrigerator ",
    "Washing Machine ",
    "Microwave ",
    "Geyser ",
    "Chimney ",
    "Television ",
    "Water Purifier ",
    "Desktop / Laptop ",
    "Lift / Elevator "
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 100,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 15, 0, 0),
                      child: Text(
                        "Services We Offer",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 0, 5),
                      child: Text(
                        "Our Products List",
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: 12,
            width: MediaQuery.of(context).size.width * 0.9,
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                color: Colors.grey,
              ),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: services.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Card(
                color: Colors.blue,
                elevation: 7,
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(tileColor: Colors.indigo,
                    title: Center(
                      child: Text(
                        services[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    onTap: () {
                      if (services[index].contains("Air")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Window Ac",
                                    ProductType2: "Split Ac",
                                    Image1: "Services (24).jpeg",
                                    Image2: "Services (26).jpeg",
                                    Image3: "Services (1).jpeg",
                                    servicetype: "Air Conditionor")));
                      } else if (services[index].contains("Refrigerator")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Single Door",
                                    ProductType2: "Double Door",
                                    Image1: "Services (17).jpeg",
                                    Image2: "Services (18).jpeg",
                                    Image3: "Services (15).jpeg",
                                    servicetype: "Refrigerator")));
                      } else if (services[index].contains("Washing")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Automatic",
                                    ProductType2: "Manual",
                                    Image1: "Services (20).jpeg",
                                    Image2: "Services (17).jpeg",
                                    Image3: "Services (13).jpeg",
                                    servicetype: "Washing Machine")));
                      } else if (services[index].contains("Microwave")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Grill Owen",
                                    ProductType2: "Solo Owen",
                                    Image1: "Services (5).jpeg",
                                    Image2: "Services (14).jpeg",
                                    Image3: "Services (12).jpeg",
                                    servicetype: "Microwave")));
                      } else if (services[index].contains("Geyser")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Below 10 liter",
                                    ProductType2: "Above 10 Liter",
                                    Image1: "Services (23).jpeg",
                                    Image2: "Services (21).jpeg",
                                    Image3: "Services (9).jpeg",
                                    servicetype: "Geyser")));
                      } else if (services[index].contains("Chimney")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Basic Chimney",
                                    ProductType2: "Island Chimney",
                                    Image1: "Services (22).jpeg",
                                    Image2: "Services (19).jpeg",
                                    Image3: "Services (7).jpeg",
                                    servicetype: "Chimney")));
                      } else if (services[index].contains("Television")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "LCD",
                                    ProductType2: "LED",
                                    Image1: "Services (6).jpeg",
                                    Image2: "Services (3).jpeg",
                                    Image3: "Services (4).jpeg",
                                    servicetype: "Television")));
                      } else if (services[index].contains("Water")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Below 7 Liters",
                                    ProductType2: "Above 7 Liter",
                                    Image1: "Services (11).jpeg",
                                    Image2: "Services (8).jpeg",
                                    Image3: "Services (10).jpeg",
                                    servicetype: "Water Purifier")));
                      } else if (services[index].contains("Desktop")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Laptop",
                                    ProductType2: "Desktop",
                                    Image1: "Services (1).jpeg",
                                    Image2: "Services (30).jpeg",
                                    Image3: "Services (28).jpeg",
                                    servicetype: "Desktop")));
                      } else if (services[index].contains("Lift")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ConfirmServices(
                                    ProductType1: "Weight Capacity 180 Kg",
                                    ProductType2: "Weight Catagory 300 Kg",
                                    Image1: "Services (27).jpeg",
                                    Image2: "Services (29).jpeg",
                                    Image3: "Services (2).jpeg",
                                    servicetype: "Lift")));
                      }
                      // },
                      // leading: Padding(
                      //   padding:
                      //   const EdgeInsets.all(8.0),
                      //   child: Image(
                      //       image: AssetImage(
                      //           _foundUsers[index]
                      //           ['img'])),
                      // ),
                    }),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
