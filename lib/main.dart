import 'package:flutter/material.dart';

import 'ColorBloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  //todo 1
  ColorBloc colorBloc = ColorBloc();

  @override
  void dispose() {
    colorBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                //todo 2
                colorBloc.eventSink.add(ColorEvent.to_amber);
              },
            ),
            SizedBox(width: 10),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                //todo 2
                colorBloc.eventSink.add(ColorEvent.to_light_blue);
              },
            ),
          ],
        ),
        appBar: AppBar(
          title: Text("Bloc Tampa Libary"),
        ),
        body: Center(
          //todo 7 setiap perubahan akan diterima
          child: StreamBuilder(
            stream: colorBloc.stateStream,
            initialData: Colors.amber,
            builder: (context, snapshot) => AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: snapshot.data,
            ),
          ),
        ),
      ),
    );
  }
}
