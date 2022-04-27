import 'package:bengal_home_service/Screens/AboutUs.dart';
import 'package:bengal_home_service/Screens/ContactUs.dart';
import 'package:bengal_home_service/Screens/FAQ.dart';
import 'package:bengal_home_service/Screens/ImagePicker.dart';
import 'package:bengal_home_service/Screens/Privacypolicy.dart';
import 'package:bengal_home_service/Screens/Suggestions.dart';
import 'package:bengal_home_service/Screens/TermsandConditon.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  List<String> profileCards = [
    "About Us",
    "Contact Us",
    "Send a Picture",
    "Complain / Suggestion",
    "FAQ",
    "Privacy Policy",
    "Terms & Conditions",
    "Feedback",
  ];

  List<IconData> profileCardsLeading = [
    Icons.info,
    Icons.phone,
    Icons.message,
    Icons.message,
    Icons.message,
    Icons.shield,
    Icons.padding,
    Icons.send,
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        Container(
          height: 70,
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 8, 15, 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Help",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Icon(
                  Icons.notifications,
                  color: Colors.white,
                )
              ],
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
                    if (profileCards[i].contains("Contact")) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ContactUs()));
                    } else if (profileCards[i].contains("About")) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => AboutUs()));
                    } else if (profileCards[i].contains("Privacy")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PrivacyPolicy()));
                    } else if (profileCards[i].contains("Terms")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => TermsandCondition()));
                    } else if (profileCards[i].contains("Feedback")) {
                      await launch(
                          "https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en_US&gl=US");
                    } else if (profileCards[i].contains("FAQ")) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => FAQ()));
                    } else if (profileCards[i].contains("Suggestion")) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Suggestions()));
                    } else if (profileCards[i].contains("Send a Picture")) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => pick()));
                    }
                    // else if (profileCards[i].contains("Communication")) {
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
    ));
  }
}
