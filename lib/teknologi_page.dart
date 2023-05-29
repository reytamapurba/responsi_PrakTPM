import 'package:flutter/material.dart';

class TeknologiPage extends StatefulWidget {
  const TeknologiPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TeknologiPage> createState() => _TeknologiPageState();
}

class _TeknologiPageState extends State<TeknologiPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CNN TEKNOLOGI"),
      ),
      body: Container(
          // child: _buildListCharBody(),
          ),
    ));
  }
}
