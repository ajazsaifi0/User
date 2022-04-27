import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/SelectLocation.dart';
import 'package:bengal_home_service/Screens/SlotBookin.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ServiceLocation extends StatefulWidget {
  const ServiceLocation({Key? key}) : super(key: key);

  @override
  _ServiceLocationState createState() => _ServiceLocationState();
}

String Price = "1134";
TextEditingController name = new TextEditingController();
TextEditingController location = new TextEditingController();
TextEditingController location2 = new TextEditingController();

class _ServiceLocationState extends State<ServiceLocation> {
  @override
  void initState() {
    getLocationDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Image.asset("assets/images/14.jpeg")),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Your Location",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: location,
                      decoration: const InputDecoration(
                        hintText: 'Location',
                        labelText: 'Location',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: location2,
                      decoration: const InputDecoration(
                        hintText: 'Flat / Building / Street',
                        labelText: 'Flat / Building / Street',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        hintText: 'Your Name',
                        labelText: 'Name',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: ElevatedButton(style: ElevatedButton.styleFrom(primary: Colors.indigo),
                onPressed: () {
                  if (location.text != "" &&
                      name.text != "" &&
                      location2.text != "") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SlotBooking(
                                name: name.text,
                                location: location.text,
                                location2: location2.text)));
                  } else {
                    Fluttertoast.showToast(
                        msg: "All Fields are Mandatory to fill");
                  }
                },
                child: Text("Continue"),
              ),
            )
          ],
        ),
      ),
    );
  }

  getLocationDetails() async {
    var address = await HelperFunctions.getAddress();
    var locality = await HelperFunctions.getLocality();
    print(locality);
    print(address);

    setState(() {
      Constants.Locality = locality!;
      Constants.Address = address!;
      location.text = address;
      location2.text = locality;
      name.text = Constants.name;
    });
  }
}
