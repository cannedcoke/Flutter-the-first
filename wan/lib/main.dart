import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 650,
            width: 300,
            child: Card(
              // color: Colors.amber, //just for now
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 100,
                children: [
                  Text(
                    'Welcome Back !!',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  SlideshowWidget(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () => {print('one')},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 50),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Text('data'),
                      ),
                      ElevatedButton(
                        onPressed: () => {print('two')},
                        style: ElevatedButton.styleFrom(
                          minimumSize: Size(90, 50),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomRight: Radius.circular(20),
                            ),
                          ),
                        ),
                        child: Text('data'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
