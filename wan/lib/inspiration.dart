import 'dart:math';
import 'package:flutter/material.dart';

class Inspiration extends StatefulWidget {
  const Inspiration({super.key});

  @override
  State<Inspiration> createState() => _InspirationState();
}

class _InspirationState extends State<Inspiration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(),
      body: Center(
      
        child: SizedBox(
          height: 700,
          width: 400,
          child: Card(
            color: Colors.green,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 150,
              children: [
                InspirationalPrhrase(),
                ElevatedButton(
                  
                  onPressed: () => setState(() {}),
                  style: ElevatedButton.styleFrom(minimumSize: Size(100, 100)),
                  child: Text('more'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InspirationalPrhrase extends StatelessWidget {
  InspirationalPrhrase({super.key});

  final List<String> phrases = [
    "You’re doing better than you think, which isn’t saying much, but still.",
    "Growth looks different on everyone, and on you it’s… subtle.",
    "You’re not behind, you’re just taking the scenic route no one asked for.",
    "Keep going, eventually even you will surprise yourself.",
    "You’ve made it this far, mostly by accident, but it counts.",
    "Progress is progress, even when it’s barely noticeable.",
    "You’re improving, slowly, quietly, almost suspiciously.",
    "Not your best work, but definitely your most recent.",
    "You’ve got potential, it’s just playing hide and seek.",
    "Every step forward matters, even the ones you trip through.",
    "You’re figuring it out, in the most chaotic way possible.",
    "Consistency is key, and you’re consistently something.",
    "You’re not failing, you’re just aggressively learning.",
    "You’ve survived worse decisions, this will be fine too",
    "You’re becoming someone, we’re all just waiting to see who",
  ];

  @override
  Widget build(BuildContext context) {
    final random = Random();
    var randomPhrase = phrases[random.nextInt(phrases.length)];
    return Text(
      randomPhrase,
      style: TextStyle(
        fontFamily: 'Arial',
        fontSize: 30,
        fontWeight: FontWeight.w900,
        color: Colors.black,
        
      ),
    );
  }
}
