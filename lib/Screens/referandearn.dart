import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
class ReferandEarn extends StatefulWidget {
  const ReferandEarn({Key? key}) : super(key: key);

  @override
  _ReferandEarnState createState() => _ReferandEarnState();
}

class _ReferandEarnState extends State<ReferandEarn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Refer and Earn")),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Who are We",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                      "Benmgal Home Services is Asia's largest online home services platform.  Launched in 2014, Benmgal Home Services today operates in India, Australia, Singapore, the UAE and The Kingdom of Saudi Arabia. The platform helps customers book reliable & high quality services -  beauty treatments, massages, haircuts, home cleaning, handymen, appliance repair, painting, pest control and more – delivered by trained professionals conveniently at home.   Benmgal Home Services's vision is to empower millions of professionals worldwide to deliver services at home like never experienced before. The Company raised Series F funding of USD 255 million in April 2021. The Series F round was led by new investors - Prosus Ventures, Dragoneer and Wellington Management with participation from existing investors - Vy Capital, Tiger Global and Steadview. The latest round includes a primary capital infusion of USD 188 million and a secondary sale of approximately USD 67 million by select angels and early investors")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "How We Do It",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                      "Benmgal Home Services is Asia's largest online home services platform.  Launched in 2014, Benmgal Home Services today operates in India, Australia, Singapore, the UAE and The Kingdom of Saudi Arabia. The platform helps customers book reliable & high quality services -  beauty treatments, massages, haircuts, home cleaning, handymen, appliance repair, painting, pest control and more – delivered by trained professionals conveniently at home.   Benmgal Home Services's vision is to empower millions of professionals worldwide to deliver services at home like never experienced before. The Company raised Series F funding of USD 255 million in April 2021. The Series F round was led by new investors - Prosus Ventures, Dragoneer and Wellington Management with participation from existing investors - Vy Capital, Tiger Global and Steadview. The latest round includes a primary capital infusion of USD 188 million and a secondary sale of approximately USD 67 million by select angels and early investors")),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  "Our Story so Far",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  child: Text(
                      "Benmgal Home Services is Asia's largest online home services platform.  Launched in 2014, Benmgal Home Services today operates in India, Australia, Singapore, the UAE and The Kingdom of Saudi Arabia. The platform helps customers book reliable & high quality services -  beauty treatments, massages, haircuts, home cleaning, handymen, appliance repair, painting, pest control and more – delivered by trained professionals conveniently at home.   Benmgal Home Services's vision is to empower millions of professionals worldwide to deliver services at home like never experienced before. The Company raised Series F funding of USD 255 million in April 2021. The Series F round was led by new investors - Prosus Ventures, Dragoneer and Wellington Management with participation from existing investors - Vy Capital, Tiger Global and Steadview. The latest round includes a primary capital infusion of USD 188 million and a secondary sale of approximately USD 67 million by select angels and early investors")),
            ),
            ElevatedButton(onPressed: ()async{
              await launch(
                  "https://play.google.com/store/apps/details?id=com.kiloo.subwaysurf&hl=en_US&gl=US");

            }, child: Text("Share app"))
          ],
        ),
      ),
    );
  }
}
