import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class CountModel extends EasyState {
  int value = 0;
  increase() {
    value++;
    update();
  }
}

CountModel countModel = CountModel();


class PlusModel extends EasyState {
  int data = 0;
  plus() {
    data += data + 1;
    update();
  }
}


void main() {
  PlusModel();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyState Default'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'EasyState Counter :',
            ),
            StreamBuilder(
              stream: countModel.stream,
              initialData: countModel,
              builder: (context, snapshot) => Text(
                snapshot.data.value.toString(),
              ),
            ),
            EasyBuilder(
              builder: (context, model) => Text(
                model.value.toString(),
              ),
              model: countModel,
            ),
            EasyBuilder<CountModel>(
              builder: (context, model) => Text(
                model.value.toString(),
              ),
            ),
            EasyBuilder<PlusModel>(
              builder: (context, PlusModel model) => Text(
                model.data.toString()
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countModel.increase();
          EasyState.get<PlusModel>().plus();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
