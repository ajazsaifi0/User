import 'package:bengal_home_service/Helper/HelperFunctions.dart';
import 'package:bengal_home_service/Screens/LogInScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboard/flutter_onboard.dart';

class OnBoardScreen extends StatefulWidget {
  const OnBoardScreen({Key? key}) : super(key: key);

  @override
  _OnBoardScreenState createState() => _OnBoardScreenState();
}

class _OnBoardScreenState extends State<OnBoardScreen> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDDDDDD),
      body: OnBoard(
        pageController: _pageController,
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        onSkip: () async {
          // print('skipped');
          await HelperFunctions.saveFirstTimeUser(false);

          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        // Either Provide onDone Callback or nextButton Widget to handle done state
        onDone: () async {
          // print('done tapped');
          await HelperFunctions.saveFirstTimeUser(false);
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => LoginScreen()));
        },
        onBoardData: onBoardData,
        titleStyles: const TextStyle(
          color: Color(0xff897A5F),
          fontSize: 18,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.15,
        ),
        descriptionStyles: TextStyle(
          fontSize: 16,
          color: Colors.brown.shade300,
        ),
        pageIndicatorStyle: const PageIndicatorStyle(
          width: 100,
          inactiveColor: Colors.grey,
          activeColor: Color(0xff897A5F),
          inactiveSize: Size(8, 8),
          activeSize: Size(12, 12),
        ),
        // Either Provide onSkip Callback or skipButton Widget to handle skip state
        skipButton: TextButton(
          onPressed: () async {
            // print('skipButton pressed');
            await HelperFunctions.saveFirstTimeUser(false);
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => LoginScreen()));
          },
          child: const Text(
            "Skip",
            style: TextStyle(
              color: Color(0xff897A5F),
            ),
          ),
        ),
        // Either Provide onDone Callback or nextButton Widget to handle done state
        nextButton: OnBoardConsumer(
          builder: (context, ref, child) {
            final state = ref.watch(onBoardStateProvider);
            return InkWell(
              onTap: () => _onNextTap(state),
              child: Container(
                width: 230,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Color(0xff897A5F),
                ),
                child: Text(
                  state.isLastPage ? "Done" : "Next",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
  //on tapping next button

  Future<void> _onNextTap(OnBoardState onBoardState) async {
    if (!onBoardState.isLastPage) {
      _pageController.animateToPage(
        onBoardState.page + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOutSine,
      );
    } else {
      //print("nextButton pressed");
      await HelperFunctions.saveFirstTimeUser(false);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    }
  }

  //onboard screen data
  final List<OnBoardModel> onBoardData = [
    const OnBoardModel(
      title: "Bengal Home Services",
      description: "Book Services at comfort of your home",
      imgUrl: "assets/images/onBoard-1.png",
    ),
    const OnBoardModel(
      title: "Find best in class services at affordable rates",
      description:
          "Find professionals whom both you and your wallet will thank",
      imgUrl: 'assets/images/onBoard-2.png',
    ),
    const OnBoardModel(
      title: "Hire them directly no middle man required",
      description:
          "Complete Transparency as you hire professionals directly with no hidden charges",
      imgUrl: 'assets/images/onBoard-3.png',
    ),
  ];
}
