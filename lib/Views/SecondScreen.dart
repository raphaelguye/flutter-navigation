import 'package:flutter/material.dart';
import '../ViewModels/ASecondScreenViewModel.dart';
import '../IoCManager.dart';

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {

  ASecondScreenViewModel viewModel;

  @override
    void initState() {
      super.initState();
      viewModel = IoCManager.ioc.get<ASecondScreenViewModel>();
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Enter your name'),
            TextField(
              onChanged: (text) => viewModel.name = text,
            ),
            RaisedButton(
              child: Text('Submit'),
              onPressed: () {
                // This call could be moved in the ViewModel who could use a DialogService...
                showDialog(
                    context: context,
                    builder: (_) => new AlertDialog(
                          title: new Text('Hello'),
                          content: new Text('Hello ${viewModel.name}'),
                        ));
              },
            )
          ],
        ),
      ),
    );
  }
}
