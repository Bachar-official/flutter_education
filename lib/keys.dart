import 'package:flutter/material.dart';
import 'dart:math' as math;

class KeysExample extends StatefulWidget {
  KeysExample();

  @override
  State<KeysExample> createState() => _KeysExampleState();
}

//key: UniqueKey()

class _KeysExampleState extends State<KeysExample> {
  List<Widget> containers = [StatefulColorfulTile(), StatefulColorfulTile()];

  void swapContainers() {
    containers.insert(0, containers.removeAt(1)); //Не замена, а модификация
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keys'),
      ),
      body: Center(
        child: Column(
          children: [
            Row(
              children: containers,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: swapContainers,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}

Color getRandomColor() =>
    Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0);

class StatefulColorfulTile extends StatefulWidget {
  //StatefulColorfulTile({Key? key}): super(key: key);

  @override
  ColorfulTileState createState() => ColorfulTileState();
}

class ColorfulTileState extends State<StatefulColorfulTile> {
  late Color myColor;

  @override
  void initState() {
    super.initState();
    myColor = getRandomColor();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: myColor,
      child: const Padding(
        padding: EdgeInsets.all(70.0),
      ),
    );
  }
}
