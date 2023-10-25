// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrumPage(),
    );
  }
}

class DrumPage extends StatefulWidget {
  const DrumPage({super.key});

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {

  final oynatici = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
            Expanded(
              child: Row(
                children: [
                  buildDrumButton("bip",Colors.red,"bip"),
                  buildDrumButton("bongo", Colors.purple,"bongo"),

                ],
              ),
            ),
          Expanded(
            child: Row(
              children: [
                buildDrumButton("clap1",Colors.white,"clap1"),
                buildDrumButton("clap2", Colors.green,"clap2"),

              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildDrumButton("clap3",Colors.grey,"clap3"),
                buildDrumButton("crash", Colors.blue,"crash"),

              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                buildDrumButton("how",Colors.orange,"how"),
                buildDrumButton("oobah", Colors.yellow,"oobah"),

              ],
            ),
          ),

        ],

      ),

    );
  }

  Widget buildDrumButton(String soundName, Color renk,String name) {
    return Expanded(
                child: TextButton(
                  onPressed: () {
                    var ses = AssetSource('$soundName.wav');
                    oynatici.play(ses);
                  },
                  child: (Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: renk
                    ),
                    height: 100,
                    width: 150,

                    child: Center(child: Text("$name",style: TextStyle(color: Colors.black),)),
                  )),
                ),
              );
  }


}
