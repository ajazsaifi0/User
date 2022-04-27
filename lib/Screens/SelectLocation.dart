import 'package:bengal_home_service/Screens/SetLocationScreen.dart';
import 'package:flutter/material.dart';

class SelectLocation extends StatefulWidget {
  @override
  _SelectLocationState createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.2,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_city,
                      size: 50,
                      color: Colors.blue,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Set Location",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 5,
                child: Container(
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SetLocationScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: 40,
                      // ),
                      Icon(
                        Icons.location_history,
                        size: 35,
                      ),
                      SizedBox(width: 30),
                      Text(
                        "Use Current Location",
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.5,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/images/14.jpeg",
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "We Only access You Location ",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "While You use this Application",
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
