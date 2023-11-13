import 'package:flutter/material.dart';

void main() {
  runApp(BuildingBlocksApp());
}

class BuildingBlocksApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BuildingBlocksGame(),
    );
  }
}

class BuildingBlocksGame extends StatefulWidget {
  @override
  _BuildingBlocksGameState createState() => _BuildingBlocksGameState();
}

class _BuildingBlocksGameState extends State<BuildingBlocksGame> {
  double rotationAngle = 0;
  List<Widget> blocks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Building Blocks'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            //Rotate the block when tapped
            setState(() {
              rotationAngle += 90;
            });
          },
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 8,
            ),
            itemCount: blocks.length,
            itemBuilder: (BuildContext context, int index) {
              return Transform.rotate(
                angle: rotationAngle *
                    (3.14159265359 / 180), //converted to radians
                child: blocks[index],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            blocks.add(Container(
              width: 50,
              height: 50,
              color: Colors.blue,
            ));
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
