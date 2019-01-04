import 'package:flutter/material.dart';
import '../ViewModels/ASecondScreenViewModel.dart';
import '../IoCManager.dart';

class SecondScreen extends StatefulWidget {
  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {
  ASecondScreenViewModel viewModel;
  TextEditingController controller;

  @override
  void initState() {
    super.initState();
    viewModel = IoCManager.ioc.get<ASecondScreenViewModel>();
    controller = TextEditingController();
    controller.addListener(() => viewModel.nameTextController.add(controller.text));
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
        onChanged: (text) => viewModel.name = text, // TODO: We should not use the viewModelText and the controller...
        controller: controller,
      ),
      StreamBuilder(
          stream: viewModel.isSubmitButtonEnabled,
          builder: (context, snapshot) {
            return RaisedButton(
                child: Text('Submit'),
                onPressed: (snapshot.data ?? false) ? () => saysHello() : null);
          }),
    ];
  }

  void saysHello() {
    viewModel.submitButtonExecute();

    //the call of showDialog could be done from the ViewModel by calling a dedicated DialogService, for example...
    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
              title: new Text('Hello'),
              content: new Text('Hello ${viewModel.name}'),
            ));
  }
}
