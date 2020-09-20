import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';


class CountModel extends EasyState {
  int value = 0;
  int value2 = 0;
  increase() {
    value ++;
    value2 += value;
    update();
  }
}
CountModel countModel = CountModel();


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  


  @override
  Widget build(BuildContext context) {

print(countModel.runtimeType);
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Easystate count:',
            ),
            StreamBuilder(
              stream: countModel.stream,
              builder: (context, snapshot) => Text(
                snapshot.data != null ? snapshot.data.value.toString() : '0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            StreamBuilder(
              stream: countModel.stream,
              builder: (context, snapshot) => Text(
                snapshot.data != null ? snapshot.data.value2.toString() : '0',
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  { 
          countModel.increase();
          },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
