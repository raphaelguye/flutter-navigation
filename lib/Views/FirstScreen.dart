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
        body: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('Go to second screen'),
                  onPressed: () {
                    viewModel.buttonClicked(context);
                  },
                ),
                RaisedButton(
                  child: Text('Go to list view'),
                  onPressed: () {
                    viewModel.buttonListViewClicked(context);
                  },
                )
              ],
            )));
  }
}
