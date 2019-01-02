import 'package:flutter/material.dart';
import '../ViewModels/AFirstScreenViewModel.dart';
import '../IoCManager.dart';

class FirstScreen extends StatefulWidget {
  @override
  FirstScreenState createState() => FirstScreenState();
}

class FirstScreenState extends State<FirstScreen> {

  AFirstScreenViewModel viewModel;

  @override
    void initState() {
      super.initState();
      viewModel = IoCManager.ioc.get<AFirstScreenViewModel>();
    }

  @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('First Screen'),
        ),
        body: Center(
          child: RaisedButton(
            child: Text('Launch screen'),
            onPressed: () {
              viewModel.buttonClicked();
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SecondScreen()),
              // );
            },
          ),
        ),
      );
    }
}