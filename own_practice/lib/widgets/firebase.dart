import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Database_options extends StatefulWidget {
  const Database_options({super.key});

  @override
  State<Database_options> createState() => _Database_optionsState();
}

class _Database_optionsState extends State<Database_options> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Firebase Database Options')),
    );
  }
}