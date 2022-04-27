import 'package:flutter/material.dart';

class Suggestions extends StatefulWidget {
  const Suggestions({Key? key}) : super(key: key);

  @override
  _SuggestionsState createState() => _SuggestionsState();
}

class _SuggestionsState extends State<Suggestions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text("Complain/Suggestions")),
        ),
        body: Column(
          children: [
            TextField(
              //  controller: _multiLineTextFieldcontroller,
              maxLines: 10,
              decoration: InputDecoration(
                hintText:
                    'Please Type Your Complain/Suggestion then click submit',
              ),
              onChanged: (str) => print('Multi-line text change: $str'),
              onSubmitted: (str) =>
                  print('This will not get called when return is pressed'),
            ),
            SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Submit'),
            ),
          ],
        ));
  }
}
