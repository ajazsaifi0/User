import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

class UpdateAddress extends StatefulWidget {
  const UpdateAddress({Key? key}) : super(key: key);

  @override
  _UpdateAddressState createState() => _UpdateAddressState();
}

class _UpdateAddressState extends State<UpdateAddress> {
  String city = "";
  String Address = "";
  TextEditingController cityController = new TextEditingController();
  TextEditingController AddController = new TextEditingController();
  void setValues() async {
    String? ct = await HelperFunctions.getLocality();
    String? Add = await HelperFunctions.getAddress();
    setState(() {
      city = ct!;
      Address = Add!;
      cityController.text = city;
      AddController.text = Address;
    });
  }

  SaveUpdatedAddress() async {
    await HelperFunctions.saveLocality(cityController.text);
    await HelperFunctions.saveAddress(AddController.text);
  }

  @override
  void initState() {
    // TODO: implement initState
    setValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Address"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: TextField(
              controller: cityController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter city',
                  hintText: 'Enter Your city'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
            child: TextField(
              controller: AddController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Enter your full Address',
                  hintText: 'Enter Your full Address'),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (AddController.text != "" && cityController.text != "") {
                  SaveUpdatedAddress();
                }
                Navigator.pop(context);
              },
              child: Text("Update Address"))
        ],
      ),
    );
  }
}
