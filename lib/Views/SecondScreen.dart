import 'package:flutter/material.dart';
import 'package:rx_widgets/rx_widgets.dart';
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
    viewModel = IoCManager.ioc.get<ASecondScreenViewModel>();
    super.initState();
  }

  @override
  void dispose() {
    viewModel.dispose();
    super.dispose();
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
          children: getWidgets(),
        ),
      ),
    );
  }

  List<Widget> getWidgets() {
    return <Widget>[
      Text('Enter your name'),
      TextField(
        onChanged: (text) => viewModel.updateNameCommand.execute(text),
      ),
      RxRaisedButton(
        rxCommand: viewModel.of(context).submitCommand,
        child: Text("Submit"),
      ),
      RxText(viewModel.resultStream),
    ];
  }
}
