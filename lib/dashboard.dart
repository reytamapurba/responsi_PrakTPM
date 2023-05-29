import 'package:flutter/material.dart';
import 'package:responsi/nasional_page.dart';
import 'package:responsi/olahraga_page.dart';
import 'package:responsi/teknologi_page.dart';
import 'package:responsi/terbaru_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: <Widget>[
          Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 160),
                Center(
                  child: Image.asset("assets/logo.png", width: 200),
                ),
                SizedBox(height: 60),
                Container(
                  width: 230,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TerbaruPage()));
                      },
                      child: const Text("Terbaru")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 230,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const NasionalPage()));
                      },
                      child: const Text("Nasional")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 230,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const OlahragaPage()));
                      },
                      child: const Text("Olahraga")),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: 230,
                  height: 40,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const TeknologiPage()));
                      },
                      child: const Text("Teknologi")),
                ),
              ])
        ]),
      ),
    );
  }
}
