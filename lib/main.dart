import 'package:easyman_app/main.default.dart';
import 'package:easyman_app/new.screen.dart';
import 'package:easyman_app/test.model.dart';
import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

CountModel countModel;
void main() {
  countModel = CountModel();
  TestModel(); // You can instantiate the model here.
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
    TestModel(); // Or you can instantiate before use.
    return Scaffold(
      appBar: AppBar(
        title: Text('EasyState Main'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'EasyState Counter :',
            ),
            StreamBuilder( // use StreamBuilder with model
              stream: countModel.stream,
              initialData: countModel,
              builder: (context, snapshot) => Text(
                snapshot.data.value.toString(),
              ),
            ),
            EasyBuilder<TestModel>( // use EasyBuilder with generic
              builder: (context, model) => Text(model.value.toString()),
            ),
            EasyBuilder( // use EasyBuilder passing model.
              builder: (context, model) => Text(
                model.value.toString(),
              ),
              model: countModel,
            ),
            RaisedButton(
              onPressed: () {
                countModel.increase();
                EasyState.get<TestModel>().decrease();
              },
              child: Text('Change Value'),
            ),
            RaisedButton(
              onPressed: () => Navigator.of(context).push(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) {
                    return NewScreen();
                  },
                ),
              ),
              child: Text('Open New Screen'),
            )
          ],
        ),
      ),
    );
  }
}
