import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/HomeScreen.dart';
import 'package:bengal_home_service/Screens/LogInScreen.dart';
import 'package:bengal_home_service/Screens/OnBoardScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  bool firstTime = true;
  bool isLoading = true;
  bool isLoggedIn = false;
  String UserName = "";
  String Address = "";
  String Locality = "";

  getloggedInState() async {
    var LoginState = await HelperFunctions.getUserLoggedInState();
    setState(() {
      if (LoginState != null) {
        isLoggedIn = LoginState;
        if (isLoggedIn == true) {
          getUsername();
        }
        isLoading = false;
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  getUsername() async {
    var number = await HelperFunctions.getUserNameFromSharedPrefrence();
    var address = await HelperFunctions.getAddress();
    var locality = await HelperFunctions.getLocality();
    print(locality);
    print(address);

    setState(() {
      if (number != null) {
        UserName = number;
        Address = address!;
        Locality = locality!;
        isLoading = false;
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  getFirstTimeState() async {
    bool? appState = await HelperFunctions.getFirstTimeloginState();
    print(appState);
    setState(() {
      if (appState != null) {
        firstTime = appState;
        if (firstTime == false) {
          getloggedInState();
        }

        isLoading = false;
      } else {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getFirstTimeState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.indigo,
        ),
        home: isLoading == false
            ? isLoading == false && firstTime == false
                ? isLoading == false && firstTime == false && isLoggedIn == true
                    ? HomeScreen(Address, Locality)
                    : LoginScreen()
                : OnBoardScreen()
            : Center(child: CircularProgressIndicator()));
  }
}
