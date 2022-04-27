import 'dart:convert';
import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/AllServices.dart';
import 'package:bengal_home_service/Screens/BookingHistory.dart';
import 'package:bengal_home_service/Screens/BookingPage.dart';
import 'package:bengal_home_service/Screens/ConfirmService.dart';
import 'package:bengal_home_service/Screens/ContactUs.dart';
import 'package:bengal_home_service/Screens/HelpPage.dart';
import 'package:bengal_home_service/Screens/LogInScreen.dart';
import 'package:bengal_home_service/Screens/PlusMemberScreen.dart';
import 'package:bengal_home_service/Screens/Profilepage.dart';
import 'package:bengal_home_service/Screens/SafteyPage.dart';
import 'package:bengal_home_service/Screens/UpdateAddress.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:number_slide_animation/number_slide_animation.dart';

import '../Services/Api.dart';

class HomeScreen extends StatefulWidget {
  String Address;
  String Locality;

  HomeScreen(this.Address, this.Locality);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  TextEditingController Search = new TextEditingController();
  final List<Map<String, dynamic>> allServices = [
    {
      "id": 1,
      "Service": "Air Conditioner ",
      "img": "assets/images/ac.webp",
    },
    {
      "id": 2,
      "Service": "Refrigerator",
      "img": "assets/images/REFRIGIRATOR.webp",
    },
    {
      "id": 3,
      "Service": "Washing Machine ",
      "img": "assets/images/WM.jpg",
    },
    {
      "id": 4,
      "Service": "Microwave",
      "img": "assets/images/Microwave.webp",
    },
    {
      "id": 5,
      "Service": "Geyser",
      "img": "assets/images/gyser.png",
    },
    {
      "id": 6,
      "Service": "Chimney",
      "img": "assets/images/Chimney.webp",
    },
    {
      "id": 7,
      "Service": "Television",
      "img": "assets/images/TV.webp",
    },
    {
      "id": 8,
      "Service": "Water Purifier ",
      "img": "assets/images/RO.jpg",
    },
    {
      "id": 9,
      "Service": "Desktop / Laptop ",
      "img": "assets/images/laptop.jpg",
    },
    {
      "id": 10,
      "Service": "Lift / Elevator ",
      "img": "assets/images/LIFT.png",
    },
  ];
  List<Map<String, dynamic>> _foundUsers = [];
  @override
  late FocusNode myFocusNode;
  initState() {
    myFocusNode = FocusNode();
    storeDataInSp();
    getCrauselImages();
    // TODO: implement initState

    print(widget.Address);
    // at the beginning, all users are shown
    _foundUsers = allServices;
    super.initState();
  }

  void dispose() {
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();

    super.dispose();
  }
  var api=new Api();
  CheckUser() async{
    var RequestBody={
      "mobile_no":MobileNumber!
    };
    dynamic response= await api.ApiCallingWithRequestBody("/user/Check.php",RequestBody);
    if(response["message"]=="not-exist"){
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp(widget.phoneNumber)));
    }else{
      // getdata();
      //Navigator.push(context, MaterialPageRoute(builder: (context)=>Dashboard()));
      setState(() {
        Constants.Id=response["data"][0]["Id"];
        Constants.name=response["data"][0]["name"];
        Constants.mobile_no=response["data"][0]["mobile_no"];
        Constants.email=response["data"][0]["email"];
        Constants.dob=response["data"][0]["dob"];
        Constants.ProfileLink=response["data"][0]["profile"];
      });
      print(Constants.Id);
      print(Constants.dob);
      await HelperFunctions.saveUserNameInSharedPrefrence(MobileNumber!);
      // Navigator.pushReplacement(
      //     context,
      //     MaterialPageRoute(
      //         builder: (context) => SelectLocation()));
    }
  }



  // This function is called whenever the text field changes
  void _runFilter(String enteredKeyword) {
    List<Map<String, dynamic>> results = [];
    if (enteredKeyword.isEmpty) {
      // if the search field is empty or only contains white-space, we'll display all users
      results = allServices;
    } else {
      results = allServices
          .where((allServices) => allServices["Service"]
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
      // we use the toLowerCase() method to make it case-insensitive
    }

    // Refresh the UI
    setState(() {
      _foundUsers = results;
    });
  }

  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[];
  String? MobileNumber;

  List<String> services = [
    "Air Conditioner ",
    "Refrigerator ",
    "Washing Machine ",
    "Microwave ",
    "Geyser ",
    "Chimney ",
    "Television ",
    "Water Purifier ",
    "Desktop / Laptop",
    "Lift / Elevator "
  ];

  List<String> servicesImg = [
    "assets/images/ac.webp",
    "assets/images/REFRIGIRATOR.webp",
    "assets/images/WM.jpg",
    "assets/images/Microwave.webp",
    "assets/images/gyser.png",
    "assets/images/Chimney.webp",
    "assets/images/TV.webp",
    "assets/images/RO.jpg",
    "assets/images/laptop.jpg",
    "assets/images/LIFT.png",
  ];
  storeDataInSp() async {
    await HelperFunctions.getUserNameFromSharedPrefrence().then((value) async {
       setState(() {
         MobileNumber = value;
         Constants.MobileNum = MobileNumber!;
       });
       await HelperFunctions.saveUserLoggedInState(true);
       await HelperFunctions.saveUserNameInSharedPrefrence(value!);
       await HelperFunctions.saveAddress(widget.Address);
       await HelperFunctions.saveLocality(widget.Locality);
       CheckUser();
     });
    // setState(() {
    //   MobileNumber = username;
    //   Constants.MobileNum = MobileNumber!;
    // });

  }

  Map<String, dynamic> getImages = {};
  List<String> UrlforCarouselImages = [];
  List<String> TextforCarouselImages = [];
  getCrauselImages() async {
    var response = await http.get(Uri.parse(
        "https://bengal-home-services-default-rtdb.firebaseio.com/HomePage/Carousel.json"));
    if (response.statusCode == 200 && response.body != null) {
      setState(() {
        getImages = jsonDecode(response.body);
        for (int i = 1; i <= 3; i++) {
          UrlforCarouselImages.add(getImages["Image$i"]);
          TextforCarouselImages.add(getImages["Image$i text"]);
        }
      });

      print(UrlforCarouselImages);
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: UrlforCarouselImages != []
          ? _selectedIndex == 0
              ? SingleChildScrollView(
                  child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
                        child: TextField(
                          controller: Search,
                          // focusNode: myFocusNode,
                          onChanged: (value) => _runFilter(value),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Search for Services',
                              fillColor: Colors.white,
                              filled: true,
                              prefixIcon: Icon(Icons.search),
                              suffixIcon: FlatButton(
                                  onPressed: () => {
                                        setState(() {
                                          Search.text = "";
                                        })
                                      },
                                  child: Icon(
                                    Icons.close,
                                  ))),
                        ),
                      ),
                      Search.text.length >= 1
                          ? Container(
                              height: 500,
                              child: _foundUsers.isNotEmpty
                                  ? ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: _foundUsers.length,
                                      itemBuilder: (context, index) => Padding(
                                        padding: const EdgeInsets.only(
                                            left: 25, right: 25),
                                        child: Card(
                                          key: ValueKey(
                                              _foundUsers[index]["id"]),
                                          color: Colors.blue,
                                          elevation: 7,
                                          margin: const EdgeInsets.symmetric(
                                              vertical: 10),
                                          child: ListTile(
                                            onTap: () {
                                              setState(() {
                                                Search.text = "";
                                              });
                                              if (_foundUsers[index]["Service"]
                                                  .contains("Air")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Window Ac",
                                                            ProductType2:
                                                                "Split Ac",
                                                            Image1:
                                                                "Services (24).jpeg",
                                                            Image2:
                                                                "Services (26).jpeg",
                                                            Image3:
                                                                "Services (1).jpeg",
                                                            servicetype:
                                                                "Air Conditioner")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Refrigerator")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Single Door",
                                                            ProductType2:
                                                                "Double Door",
                                                            Image1:
                                                                "Services (17).jpeg",
                                                            Image2:
                                                                "Services (18).jpeg",
                                                            Image3:
                                                                "Services (15).jpeg",
                                                            servicetype:
                                                                "Refrigerator")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Washing")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Automatic",
                                                            ProductType2:
                                                                "Manual",
                                                            Image1:
                                                                "Services (20).jpeg",
                                                            Image2:
                                                                "Services (17).jpeg",
                                                            Image3:
                                                                "Services (13).jpeg",
                                                            servicetype:
                                                                "Washing Machine")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Microwave")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Grill Owen",
                                                            ProductType2:
                                                                "Solo Owen",
                                                            Image1:
                                                                "Services (5).jpeg",
                                                            Image2:
                                                                "Services (14).jpeg",
                                                            Image3:
                                                                "Services (12).jpeg",
                                                            servicetype:
                                                                "Microwave")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Geyser")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Below 10 liter",
                                                            ProductType2:
                                                                "Above 10 Liter",
                                                            Image1:
                                                                "Services (23).jpeg",
                                                            Image2:
                                                                "Services (21).jpeg",
                                                            Image3:
                                                                "Services (9).jpeg",
                                                            servicetype:
                                                                "Geyser")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Chimney")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Basic Chimney",
                                                            ProductType2:
                                                                "Island Chimney",
                                                            Image1:
                                                                "Services (22).jpeg",
                                                            Image2:
                                                                "Services (19).jpeg",
                                                            Image3:
                                                                "Services (7).jpeg",
                                                            servicetype:
                                                                "Chimney")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Television")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1: "LCD",
                                                            ProductType2: "LED",
                                                            Image1:
                                                                "Services (6).jpeg",
                                                            Image2:
                                                                "Services (3).jpeg",
                                                            Image3:
                                                                "Services (4).jpeg",
                                                            servicetype:
                                                                "Television")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Water")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Below 7 Liters",
                                                            ProductType2:
                                                                "Above 7 Liter",
                                                            Image1:
                                                                "Services (11).jpeg",
                                                            Image2:
                                                                "Services (8).jpeg",
                                                            Image3:
                                                                "Services (10).jpeg",
                                                            servicetype:
                                                                "Water Purifier")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Desktop")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Laptop",
                                                            ProductType2:
                                                                "Desktop",
                                                            Image1:
                                                                "Services (1).jpeg",
                                                            Image2:
                                                                "Services (30).jpeg",
                                                            Image3:
                                                                "Services (28).jpeg",
                                                            servicetype:
                                                                "Desktop")));
                                              } else if (_foundUsers[index]
                                                      ["Service"]
                                                  .contains("Lift")) {
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) => ConfirmServices(
                                                            ProductType1:
                                                                "Weight Capacity 180 Kg",
                                                            ProductType2:
                                                                "Weight Catagory 300 Kg",
                                                            Image1:
                                                                "Services (27).jpeg",
                                                            Image2:
                                                                "Services (29).jpeg",
                                                            Image3:
                                                                "Services (2).jpeg",
                                                            servicetype:
                                                                "Lift")));
                                              }
                                            },
                                            leading: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Image(
                                                  image: AssetImage(
                                                      _foundUsers[index]
                                                          ['img'])),
                                            ),
                                            title: Text(
                                              _foundUsers[index]['Service'],
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const Text(
                                      'No results found',
                                      style: TextStyle(fontSize: 24),
                                    ),
                            )
                          : Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 4,
                                color: Colors.grey,
                              ),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.1,
                          width: MediaQuery.of(context).size.width,
                          child: ListTile(
                            leading: Icon(
                              Icons.location_on,
                              size: 30,
                            ),
                            title: Text(
                              widget.Locality,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            ),
                            subtitle: Text(widget.Address),
                            trailing: GestureDetector(
                              child: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateAddress()));
                              },
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                            height: 200.0,
                            autoPlay: true,
                          ),
                          items: UrlforCarouselImages.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                    width: MediaQuery.of(context).size.width,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 5.0),
                                    child: Image.network(i));
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.07,
                          color: Colors.white,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.star),
                              FittedBox(
                                child: Text(
                                  "PLUS",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              FittedBox(
                                child: Text(
                                  "Save 20% on Every Service",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward,
                                size: 30,
                              )
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PlusMember()));
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "OUR ACHIEVEMENTS",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  children: [
                                    NumberSlideAnimation(
                                      number: "358",
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceIn,
                                      textStyle: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "K",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Text("Hours of Work")
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    NumberSlideAnimation(
                                      number: "29",
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceIn,
                                      textStyle: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "+",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Text("Projects Done")
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  children: [
                                    NumberSlideAnimation(
                                      number: "358",
                                      duration: const Duration(seconds: 2),
                                      curve: Curves.bounceIn,
                                      textStyle: TextStyle(
                                          fontSize: 28.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Text(
                                        "%",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                Text("Client Satisfaction")
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "Services",
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      GridView.count(
                          physics: new NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          crossAxisCount: 3,
                          crossAxisSpacing: 2.0,
                          mainAxisSpacing: 8.0,
                          children: List.generate(services.length, (index) {
                            return GestureDetector(
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
                                              servicetype: "Air Conditioner")));
                                } else if (services[index]
                                    .contains("Refrigerator")) {
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
                                } else if (services[index]
                                    .contains("Washing")) {
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
                                } else if (services[index]
                                    .contains("Microwave")) {
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
                                } else if (services[index]
                                    .contains("Chimney")) {
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
                                } else if (services[index]
                                    .contains("Television")) {
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
                                } else if (services[index]
                                    .contains("Desktop")) {
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
                                              ProductType1:
                                                  "Weight Capacity 180 Kg",
                                              ProductType2:
                                                  "Weight Catagory 300 Kg",
                                              Image1: "Services (27).jpeg",
                                              Image2: "Services (29).jpeg",
                                              Image3: "Services (2).jpeg",
                                              servicetype: "Lift ")));
                                }
                              },
                              child: Card(
                                  color: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 0),
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: <Widget>[
                                          Image.asset(
                                            servicesImg[index],
                                            width: 50,
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 4),
                                            child: Container(
                                                height: 40,
                                                alignment: Alignment.centerLeft,
                                                child: Center(
                                                    child: Text(
                                                  services[index],
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 14),
                                                ))),
                                          ),
                                        ]),
                                  )),
                            );
                          })),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              child: Text(
                                "Customer Safety is Our Priority",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 8),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FittedBox(
                              child: Text(
                                "Our Safety Products",
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.copy,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Covid 19 Testing",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 60),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.masks,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Safety Equipments",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 60),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thermostat,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Daily Temprature Checks",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 60),
                        child: Container(
                          height: 4,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.delete,
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Single Use Product & Dispose",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ))

              // For Saftey Page
              : _selectedIndex == 1
                  ? SafteyPage()
                  // For Booking Page
                  : _selectedIndex == 2
                      ? BookingHistory()

                      // FOR PROFILE PAGE
                      : _selectedIndex == 3
                          ? Profilepage(
                              phoneNumber: MobileNumber,
                            )
                          // For Help Page
                          : _selectedIndex == 4
                              ? HelpPage()
                              : SafeArea(child: Container())
          : Center(child: CircularProgressIndicator()),
      bottomNavigationBar: BottomNavigationBar(backgroundColor: Colors.indigo,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.ac_unit),
            label: 'Services',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_add),
            label: 'Bookings',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.indigo,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Help',
            backgroundColor: Colors.indigo,
          )
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await FirebaseAuth.instance.signOut();
      //     await HelperFunctions.saveUserLoggedInState(false);
      //     Navigator.pushReplacement(
      //         context, MaterialPageRoute(builder: (context) => LoginScreen()));
      //   },
      //   child: Icon(Icons.logout),
      // ),
    );
  }
}
