import 'package:flutter/material.dart';

class OvaTaskScreen2 extends StatelessWidget {
  const OvaTaskScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Main content goes here',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              padding: const EdgeInsets.all(8.0),
              // using FitBox if the inside text font is more thean the space it will take the avaliable space only it will not overflow or not go out of the screen height and width
              child: const FittedBox(
                fit: BoxFit.scaleDown,
                child: Center(
                    child: Text(
                  'Hello this text will be fitted in that 10% of screen',
                  style: TextStyle(color: Colors.white, fontSize: 50),
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OvaTaskScreen extends StatelessWidget {
  const OvaTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 9,
            child: Container(
              color: Colors.blue,
              child: const Center(
                child: Text(
                  'Main content goes here',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: LayoutBuilder(
              builder: (context, constraints) {
                double availableHeight = constraints.maxHeight;
                double availableWidth = constraints.maxWidth;

                return Container(
                  padding: const EdgeInsets.all(8.0),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        maxHeight: availableHeight,
                        maxWidth: availableWidth,
                      ),
                      child: const Text(
                        'Hello this text will be fitted in that 10% of screen',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 30,
                        ),
                        textAlign: TextAlign.center,
                        softWrap: true,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
