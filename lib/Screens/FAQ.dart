import 'package:flutter/material.dart';

class FAQ extends StatefulWidget {
  const FAQ({Key? key}) : super(key: key);

  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("FAQ'S")),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FittedBox(
                      child: Text(
                    "What is Happiness Gurantee?",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Your Happiness is our goal. if you are not happy, we will work to make it right!",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Icon(
              Icons.person,
              color: Colors.grey,
              size: 80,
            ),
            Text(
              "Verified Professions",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "All our service Providers are Screened,background verified and rated by customers like you.Every service provider goes through strict round of skills assesment, police verification & background check before they are on board on our platform",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Icon(
              Icons.home,
              color: Colors.grey,
              size: 80,
            ),
            Text(
              "Insured Work",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "In the rare event of a damage, every booking on the BHS platform is Insured by up to Rs 10000",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Icon(
              Icons.shield,
              color: Colors.grey,
              size: 80,
            ),
            Text(
              "Re-work Assurance",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Housejoy Strives to offer top quality services for you and your home every time.if you are not satisfied with the quality of the services. we will get a rework done to your satisfaction at no extra charge",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
            Icon(
              Icons.perm_contact_cal,
              color: Colors.grey,
              size: 80,
            ),
            Text(
              "Professional Support",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Want to get in touch with us directly to express a concern or have some queries that need immediate responses? Chat with us,write us an email or even call us to get through to our round the clock support team that's already ready to go that extra mile for your happiness",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
