import 'package:flutter/material.dart';

class OlahragaPage extends StatefulWidget {
  const OlahragaPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OlahragaPage> createState() => _OlahragaPageState();
}

class _OlahragaPageState extends State<OlahragaPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CNN OLAHRAGA"),
      ),
      body: Container(
          // child: _buildListCharBody(),
          ),
    ));
  }
}
