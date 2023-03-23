import 'package:flutter/material.dart';

import 'onboarding_view_model.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late OnBoardingViewModel onBoardingViewModel;

  @override
  void initState() {
    super.initState();
    onBoardingViewModel = OnBoardingViewModel();
    onBoardingViewModel.init();
  }

  @override
  void dispose() {
    onBoardingViewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              StreamBuilder(
                stream: onBoardingViewModel.slideStream,
                builder: (context, snapshot) {
                  if (snapshot == null) {
                    return Container();
                  }
                  return Center(
                    child: Text(
                      snapshot.data.toString(),
                      style: TextStyle(fontSize: 30),
                    ),
                  );
                },
              ),
              IconButton(
                onPressed: () {
                  onBoardingViewModel.nextPage();
                },
                icon: Icon(Icons.exposure_plus_1),
              ),
              IconButton(
                onPressed: () {
                  onBoardingViewModel.previousPage();
                },
                icon: Icon(Icons.exposure_minus_1),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
