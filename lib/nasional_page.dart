import 'package:flutter/material.dart';

class NasionalPage extends StatefulWidget {
  const NasionalPage({
    Key? key,
  }) : super(key: key);

  @override
  State<NasionalPage> createState() => _NasionalPageState();
}

class _NasionalPageState extends State<NasionalPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CNN NASIONAL"),
      ),
      body: Container(
          // child: _buildListCharBody(),
          ),
    ));
  }
}
