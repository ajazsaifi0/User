import 'package:bengal_home_service/Constants.dart';
import 'package:bengal_home_service/Screens/AMC.dart';
import 'package:bengal_home_service/Screens/AboutUs.dart';
import 'package:bengal_home_service/Screens/BookingHistory.dart';
import 'package:bengal_home_service/Screens/Comm_prefs.dart';
import 'package:bengal_home_service/Screens/Payment.dart';
import 'package:bengal_home_service/Screens/Privacypolicy.dart';
import 'package:bengal_home_service/Screens/ProfileForm.dart';
import 'package:bengal_home_service/Screens/TermsandConditon.dart';
import 'package:bengal_home_service/Screens/UpdateAddress.dart';
import 'package:bengal_home_service/Screens/referandearn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Helper/HelperFunctions.dart';
import 'LogInScreen.dart';
import 'Pdf.dart';
import 'PlusMemberScreen.dart';

class Profilepage extends StatefulWidget {
  final String? phoneNumber;
  Profilepage({required this.phoneNumber});

  @override
  _ProfilepageState createState() => _ProfilepageState();
}

class _ProfilepageState extends State<Profilepage> {
  List<String> profileCards = [
    "My Personal Details",
    "Download Vendors Application",
    "My Orders",
    "Manage Address",
    "Refer & Earn",
    "Download Invoice",
    "Payment Options",
    "Share BHS",
    "Whatsapp Us",
    "AMC",
    "Communication preferences",
    "Plus Membership",
    "Privacy Policy",
    "Rate us",
    "Log Out"
  ];
  List<IconData> profileCardsLeading = [
    Icons.info,
    Icons.person,
    Icons.info,
    Icons.description,
    Icons.info,
    Icons.account_balance_wallet,

    Icons.account_balance_wallet,
    Icons.eleven_mp,
    Icons.alarm_on_sharp,
    Icons.description,
    Icons.phonelink_ring,
    Icons.person,
    Icons.info,
    Icons.rate_review,
    Icons.logout
  ];

  // List<String> profileCards = [
  //   "Register As Partner",
  //   "About Bengal Home Services",
  //   "Share BHS",
  //   "My Wallet",
  //   "My Scheduled Bookings",
  //   "WhatsApp Us",
  //   "Plus Membership"
  // ];
  // List<IconData> profileCardsLeading = [
  //   Icons.account_balance_wallet,
  //   Icons.alarm_on_sharp,
  //   Icons.description,
  //   Icons.phonelink_ring,
  //   Icons.person,
  //   Icons.offline_bolt,
  //   Icons.person_search_sharp,
  //   // Icons.info,
  //   // Icons.rate_review,
  //   // Icons.account_box_outlined,
  //   // Icons.contact_phone,
  //   // Icons.contact_phone
  // ];
  // List<String> profileCardsDescription = [
  //   "Transaction History",
  //   "Set Alerts for payment,policy renewal,etc.",
  //   "Store,quickly access & share documents",
  //   "Chose how we Communicate with you",
  //   "Find if you spoke to a genuine advisor from policyInvest",
  //   "Access Your Policy without internet",
  //   "Leading Insurers with only the best plans",
  //   "Our legal & administrative guidelines",
  //   "how did you like policy Invest app",
  //   "Our Licenses",
  //   "Group health Insurance",
  //   "Group health Insurance"
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Container(
      child: Column(
        children: [
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
                    image: DecorationImage(
                        image: NetworkImage("https://bengalhomeservices.com/user/images/"+Constants.ProfileLink)
                      
                    )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [],
                  ),
                )
              ],
            ),
          ),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       widget.username.toUpperCase(),
          //       style: TextStyle(
          //           color: Colors.blueAccent,
          //           fontSize: 20,
          //           fontWeight: FontWeight.w600,
          //           fontFamily: "AkayaKanadaka"),
          //     )
          //   ],
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.phoneNumber!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: "AkayaKanadaka"),
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: SizedBox(
              height: 1,
              child: Container(
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: profileCards.length,
              itemBuilder: (context, i) {
                return Card(
                  child: GestureDetector(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(
                          profileCardsLeading[i],
                          color: Colors.black,
                          size: 30,
                        ),
                        title: Text(
                          profileCards[i],
                          style: TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    onTap: () async {
                      if (profileCards[i].contains("Personal")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => profileForm()));
                      } else if (profileCards[i].contains("Whatsapp Us")) {
                        await launch("https://web.whatsapp.com/");
                      } else if (profileCards[i].contains("Share BHS") ||
                          profileCards[i].contains("Rate us") ||
                          profileCards[i].contains("Vendors")) {
                        await launch(
                            "https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en_US&gl=US");
                      } else if (profileCards[i].contains("Plus Membership")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlusMember()));

                      }
    else if (profileCards[i].contains("Download Invoice")) {
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => pdf()));}
                      else if (profileCards[i].contains("Privacy Policy")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PrivacyPolicy()));
                      } else if (profileCards[i]
                          .contains("About Bengal Home Services")) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AboutUs()));
                      } else if (profileCards[i]
                          .contains("Terms and Conditions")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TermsandCondition()));
                      } else if (profileCards[i].contains("Communication")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Comm_Prefs()));
                      } else if (profileCards[i].contains("Manage")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => UpdateAddress()));
                      } else if (profileCards[i].contains("My Orders") ||
                          profileCards[i].contains("Booking")) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BookingHistory()));
                      } else if (profileCards[i].contains("AMC")) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => AMC()));
                      }else if(profileCards[i].contains("Log")){
                        await FirebaseAuth.instance.signOut();
                        await HelperFunctions.saveUserLoggedInState(false);
                        Navigator.pushReplacement(
                            context, MaterialPageRoute(builder: (context) => LoginScreen()));
                      }else if (profileCards[i].contains("Refer")) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ReferandEarn()));
                      }else if (profileCards[i].contains("Payment Options")) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Payment()));
                      }
                      else{
                        Fluttertoast.showToast(msg: "Coming Soon");
                      }
                      // else if (profileCards[i].contains("Reminders")) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Reminders()));
                      // } else if (profileCards[i].contains("Communication")) {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => Comm_Prefs()));
                      // }
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    ));
  }
}
