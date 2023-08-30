import 'package:flashlight_app/homepage.dart';
import 'package:flutter/material.dart';

import 'package:torch_controller/torch_controller.dart';

void main() {
  TorchController().initialize(); // Initialize the TorchControl instance
  runApp(TorchApp());
}

class TorchApp extends StatefulWidget {
  @override
  _TorchAppState createState() => _TorchAppState();
}

class _TorchAppState extends State<TorchApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
