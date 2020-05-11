import 'package:flutter/material.dart';

//Custom widgets
import 'jobs_listView.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job Portal',
      theme: ThemeData(brightness: Brightness.dark),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Programmers Job Portal'),
        ),
        body: Center(child: JobsListView()),
      ),
    );
  }
}
