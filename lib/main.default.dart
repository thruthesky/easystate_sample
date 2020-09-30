
import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class PlusModel extends EasyState {
  int value = 0;
  plus() {
    value += value + 1;
    update();
  }
}
class CountModel extends EasyState {
  int value = 0;
  increase() {
    value++;
    update();
  }
}
CountModel countModel = CountModel();

void main() {
  PlusModel plusModel = PlusModel();
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
              builder: (context, snapshot) => Text(snapshot.data.value.toString()),
              model: countModel,
            ),
            EasyBuilder<CountModel>(
              builder: (context, snapshot) => Text(snapshot.data.value.toString()),
            ),
            EasyBuilder<PlusModel>(
              builder: (context, snapshot) => Text(snapshot.data.value.toString()),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { countModel.increase(); EasyState.find<PlusModel>().plus(); },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
