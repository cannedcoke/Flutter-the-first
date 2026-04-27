import 'package:flutter/material.dart';
import 'package:wan/tareas.dart';
import 'package:wan/inspiration.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: HomeScreen()));
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 3, 3, 0),
      body: Center(
        child: SizedBox(
          height: 700,
          width: 400,

          child: Card(
            color: const Color.fromARGB(208, 234, 237, 52), //just for now
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 100,
              children: [
                Text(
                  'Welcome Back !!',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Pictures(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Inspiration(),
                          ),
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90, 50),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(
                          156,
                          255,
                          255,
                          255,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Text('Inspiracion'),
                    ),
                    ElevatedButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Tareas()),
                        ),
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(90, 50),
                        foregroundColor: Colors.black,
                        backgroundColor: const Color.fromARGB(
                          156,
                          255,
                          255,
                          255,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                      ),
                      child: Text('Tareas'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Pictures extends StatefulWidget {
  const Pictures({super.key});

  @override
  State<Pictures> createState() => _PictureState();
}

class _PictureState extends State<Pictures> {
  int _index = 0;

  final List<String> images = [
    'assets/confidence.jpg',
    'assets/deserve.jpg',
    'assets/dog.jpg',
    'assets/horse.jpg',
    'assets/hydrate.jpg',
    'assets/lockin.jpg',
    'assets/seed.jpg',
    'assets/tests.jpg',
  ];

  @override
  void initState() {
    super.initState();

    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _index = (_index + 1) % images.length;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 600),
      child: ClipRRect(
        key: ValueKey(_index),
        borderRadius: BorderRadius.circular(20),
        child: Image.asset(images[_index], height: 200),
      ),
    );
  }
}
