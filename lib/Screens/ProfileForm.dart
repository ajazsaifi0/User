
import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Services/Api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../Services/Api.dart';





class profileForm extends StatefulWidget {
  @override
  _profileFormState createState() => _profileFormState();
}

class _profileFormState extends State<profileForm> {
  TextEditingController nameController = TextEditingController();
  TextEditingController dateinput = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  var gender = "Male";
  late int age = 0;
  String formattedDate = "";
  late String _chosenIncome = "";
  late String _maritalStatus = "";
  late String _State = "";

  late String _errorText = "";
  static final List<String> _dropdownItems = <String>[
    "upto 3 lakhs",
    "3-5 lakhs",
    "5-7 lakhs",
    "7-10 lakhs",
    "10-15 lakhs",
    "15+ lakhs",
    "less than 1 lakh"
  ];
  static final List<String> _maritalStatusItems = <String>[
    "single",
    "Married",
    "Divorced",
    "Widow(er)"
  ];

  calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    int month1 = currentDate.month;
    int month2 = birthDate.month;
    if (month2 > month1) {
      age--;
    } else if (month1 == month2) {
      int day1 = currentDate.day;
      int day2 = birthDate.day;
      if (day2 > day1) {
        age--;
      }
    }
    return age;
  }

  setValues() async {
    var phoneNumber = await HelperFunctions.getUserNameFromSharedPrefrence();
    setState(() {
      phoneController.text = phoneNumber!;
    });
  }
  var api=new Api();
  @override
  void initState() {
    // TODO: implement initState
    setValues();
    setState(() {
      nameController.text=Constants.name;
      dateinput.text=Constants.dob;
      emailController.text=Constants.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: GestureDetector(
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.white60,
                              width: 1,
                              style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff0f5ff)),
                      child: Center(
                        child: Icon(Icons.arrow_back_ios_rounded),
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.blue,
                      ),
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.grey[200],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [],
                    ),
                  )
                ],
              ),
            ),

            //Radio Buttons
            // Padding(
            //   padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
            //   child: Container(
            //     child: Center(
            //       child: CustomRadioButton(
            //         enableShape: true,
            //         elevation: 0,
            //         absoluteZeroSpacing: false,
            //         unSelectedColor: Theme.of(context).canvasColor,
            //         buttonLables: [
            //           'Male',
            //           'Female',
            //         ],
            //         buttonValues: [
            //           'Male',
            //           'Female',
            //         ],
            //         buttonTextStyle: ButtonTextStyle(
            //             selectedColor: Colors.white,
            //             unSelectedColor: Colors.black,
            //             textStyle: TextStyle(fontSize: 16)),
            //         radioButtonValue: (value) {
            //           // gender = value;
            //           print(gender);
            //         },
            //         width: 150,
            //         defaultSelected: "Male",
            //         selectedColor: Color(0xff0064ff),
            //       ),
            //     ),
            //   ),
            // ),

            //name textfield
            Padding(
              padding: EdgeInsets.only(top: 15, left: 20, right: 20),
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: TextField(
                  controller: nameController,
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: InputDecoration(
                    // border: new OutlineInputBorder(
                    //     borderSide: new BorderSide(color: Colors.teal[500]),borderRadius: BorderRadius.circular(20)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xff0064ff), width: 2.0),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    fillColor: Colors.lightBlueAccent,
                    labelText: 'Your Name',
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  // onChanged: (value){
                  //   userName=value;
                  //   print(userName);
                  // },
                ),
              ),
            ),

            //  date textfield
            Container(
                padding: EdgeInsets.only(left: 20, right: 20, top: 15),
                child: Center(
                    child: TextField(
                  controller: dateinput, //editing controller of this TextField
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff0064ff), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      // icon: Icon(Icons.calendar_today), //icon of text field
                      labelText: "Date of Birth(DD-MM-YYYY)",
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ), //label text of field
                      suffixText: age.toString() + " years"),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(
                            1955), //DateTime.now() - not to allow to choose before today.
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate1 =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      age = calculateAge(pickedDate);
                      print(age);
                      formattedDate =
                          DateFormat('dd-MMMM-yyyy').format(pickedDate);
                      print(
                          formattedDate); //formatted date output using intl package =>  2021-03-16
                      //you can implement different kind of Date Format here according to your requirement

                      setState(() {
                        dateinput.text =
                            formattedDate1; //set output date to TextField value.
                      });
                    } else {
                      print("Date is not selected");
                    }
                  },
                ))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
              child: Row(
                children: [Text("• " + formattedDate)],
              ),
            ),

            //email field
            Padding(
              padding: EdgeInsets.only(top: 10, left: 20, right: 20),
              child: TextField(
                controller: emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  // border: new OutlineInputBorder(
                  //     borderSide: new BorderSide(color: Colors.teal[500]),borderRadius: BorderRadius.circular(20)),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xff0064ff), width: 2.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  fillColor: Colors.lightBlueAccent,
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                // onChanged: (value){
                //   Email=value;
                //   print(Email);
                // },
              ),
            ),

            //income field

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: FormField(builder: (FormFieldState state) {
            //     return DropdownButtonHideUnderline(
            //       child: new Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: <Widget>[
            //           new InputDecorator(
            //             decoration: InputDecoration(
            //               filled: false,
            //               hintText: 'Annual Income',
            //               labelText: _chosenIncome == null
            //                   ? 'Annual Income'
            //                   : 'Annual Income',
            //               errorText: _errorText,
            //             ),
            //             isEmpty: _chosenIncome == null,
            //             child: new DropdownButton<String>(
            //               value: _chosenIncome,
            //               isDense: true,
            //               onChanged: (newValue) {
            //                 setState(() {
            //                   // _chosenIncome = newValue;
            //                 });
            //                 print('${_chosenIncome}');
            //               },
            //               items: _dropdownItems.map((String value) {
            //                 return DropdownMenuItem<String>(
            //                   value: value,
            //                   child: Text(value),
            //                 );
            //               }).toList(),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ),

            //mobile phone field
            Padding(
                padding: EdgeInsets.only(top: 15, left: 20, right: 20),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: TextField(
                    controller: phoneController,
                    readOnly: true,
                    maxLength: 13,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      // border: new OutlineInputBorder(
                      //     borderSide: new BorderSide(color: Colors.teal[500]),borderRadius: BorderRadius.circular(20.0),),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                            color: Color(0xff0064ff), width: 2.0),
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      fillColor: Colors.lightBlueAccent,
                      labelText: 'Phone No.',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      suffixIcon: Container(
                        child: Icon(Icons.lock, color: Colors.grey),
                      ),
                    ),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    // onChanged: (value){
                    //   phoneNumber=CountryCode+value;
                    //   print(phoneNumber);
                    // },
                  ),
                )),

            //state field
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: FormField(builder: (FormFieldState state) {
            //     return DropdownButtonHideUnderline(
            //       child: new Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: <Widget>[
            //           new InputDecorator(
            //             decoration: InputDecoration(
            //               filled: false,
            //               hintText: 'State',
            //               labelText: _State == null ? 'State' : 'State',
            //               errorText: _errorText,
            //             ),
            //             isEmpty: _State == null,
            //             child: new DropdownButton<String>(
            //               value: _State,
            //               isDense: true,
            //               onChanged: (newValue) {
            //                 setState(() {
            //                   // _State = newValue;
            //                 });
            //                 print('${_State}');
            //               },
            //               items: Constants.states.map((String value) {
            //                 return DropdownMenuItem<String>(
            //                   value: value,
            //                   child: Text(value),
            //                 );
            //               }).toList(),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ),

            //marital status

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 20),
            //   child: FormField(builder: (FormFieldState state) {
            //     return DropdownButtonHideUnderline(
            //       child: new Column(
            //         crossAxisAlignment: CrossAxisAlignment.stretch,
            //         children: <Widget>[
            //           new InputDecorator(
            //             decoration: InputDecoration(
            //               filled: false,
            //               hintText: 'Marital Status',
            //               labelText: _maritalStatus == null
            //                   ? 'Marital Status'
            //                   : 'Marital Status',
            //               errorText: _errorText,
            //             ),
            //             isEmpty: _maritalStatus == null,
            //             child: new DropdownButton<String>(
            //               value: _maritalStatus,
            //               isDense: true,
            //               onChanged: (newValue) {
            //                 setState(() {
            //                   // _maritalStatus = newValue;
            //                 });
            //                 print('${_maritalStatus}');
            //               },
            //               items: _maritalStatusItems.map((String value) {
            //                 return DropdownMenuItem<String>(
            //                   value: value,
            //                   child: Text(value),
            //                 );
            //               }).toList(),
            //             ),
            //           ),
            //         ],
            //       ),
            //     );
            //   }),
            // ),

            //Submit Button

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: GestureDetector(
                child: Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Color(0xff0064ff),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                    child: Text(
                      "Save details",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                onTap: (){

                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
