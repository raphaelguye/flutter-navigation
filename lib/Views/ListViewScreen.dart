import 'package:flutter/material.dart';
import '../ViewModels/AListViewScreenViewModel.dart';
import '../IoCManager.dart';

class ListViewScreen extends StatefulWidget {
  @override
  ListViewScreenState createState() => ListViewScreenState();
}

class ListViewScreenState extends State<ListViewScreen> {
  AListViewScreenViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = IoCManager.ioc.get<AListViewScreenViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List View Screen'),
      ),
      body: Column(children: <Widget>[
        Text('todo'),
      ]),
    );
  }
}
