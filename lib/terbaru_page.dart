import 'package:flutter/material.dart';

class TerbaruPage extends StatefulWidget {
  const TerbaruPage({
    Key? key,
  }) : super(key: key);

  @override
  State<TerbaruPage> createState() => _TerbaruPageState();
}

class _TerbaruPageState extends State<TerbaruPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("CNN TERBARU"),
      ),
      body: Container(
          // child: _buildListCharBody(),
          ),
    ));
  }
}
