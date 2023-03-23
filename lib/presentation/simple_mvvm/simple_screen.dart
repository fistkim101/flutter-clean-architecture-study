import 'package:flutter/material.dart';
import 'package:flutter_clean_architecture/presentation/simple_mvvm/simple_view_model.dart';

class SimpleScreen extends StatefulWidget {
  @override
  _SimpleScreenState createState() => _SimpleScreenState();
}

class _SimpleScreenState extends State<SimpleScreen> {
  SimpleViewModel viewModel = SimpleViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            StreamBuilder(
              stream: viewModel.mvvmStream,
              builder: (context, snapshot) {
                print('StreamBuilder > build > snapshot : ${snapshot.data}');
                int count = 0;
                if (snapshot.data != null) {
                  count = snapshot.data!.count;
                }
                return Center(
                  child: Text(
                    count.toString(),
                    style: TextStyle(fontSize: 30),
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    viewModel.increaseCounter();
                  },
                  icon: Icon(Icons.exposure_plus_1),
                ),
                IconButton(
                  onPressed: () {
                    viewModel.decreaseCounter();
                  },
                  icon: Icon(Icons.exposure_minus_1),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
