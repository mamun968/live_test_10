import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    return MaterialApp(
      title: 'Orientation Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OrientationPage(),
    );
  }
}

class OrientationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News Feed'),
      ),
      body: OrientationBuilder(
        builder: (BuildContext context, Orientation orientation) {
          return Center(
            child: _buildContainerLayout(orientation),
          );
        },
      ),
    );
  }

  Widget _buildContainerLayout(Orientation orientation) {
    if (orientation == Orientation.portrait) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            20,
            (index) => Container(
              child: const Center(
                  child: Text("150*150", style: TextStyle(fontSize: 30))),
              width: 150,
              height: 150,
              color: Colors.grey,
              margin: const EdgeInsets.all(8),
            ),
          ),
        ),
      );
    } else {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: List.generate(
            2,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 90),
              child: Column(
                children: List.generate(
                  10,
                  (index) => Container(
                    width: 150,
                    height: 150,
                    color: Colors.grey,
                    margin:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                    child: const Center(
                        child: Text("150*150", style: TextStyle(fontSize: 30))),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
}
