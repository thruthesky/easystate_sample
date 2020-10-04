
import 'dart:async';

import 'package:easyman_app/main.default.dart';
import 'package:easystate/easystate.dart';
import 'package:flutter/material.dart';

class NewScreen extends StatefulWidget {
  const NewScreen({
    Key key,
  }) : super(key: key);

  @override
  _NewScreenState createState() => _NewScreenState();
}

class _NewScreenState extends State<NewScreen> {
  StreamSubscription stream;
  CountModel countModel = EasyState.get<CountModel>();

  @override
  void initState() {
    stream = countModel.stream.listen((value) => setState(() => null));
    super.initState();
  }

  @override
  void dispose() {
    stream.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Saved Suggestions'),
      ),
      body: Column(
        children: [
          Text(countModel.value.toString()),
          RaisedButton(
            onPressed: () => setState(() => countModel.increase()),
            child: Text('Increase with setState()'),
          ),
          Divider(),
          Text(countModel.value.toString()),
          RaisedButton(
            onPressed: () => setState(() => countModel.increase()),
            child: Text('Increase with stream listing & setState()'),
          ),
          RaisedButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
