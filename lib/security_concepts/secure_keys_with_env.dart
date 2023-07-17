import 'package:flutter/material.dart';
import 'package:flutter_owasp/constants.dart';

class FetchEnvKey extends StatefulWidget {
  const FetchEnvKey({Key? key}) : super(key: key);

  @override
  State<FetchEnvKey> createState() => _FetchEnvKeyState();
}

class _FetchEnvKeyState extends State<FetchEnvKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key fetched from Environment'),
      ),
      body: const Center(
        child: Text(String.fromEnvironment('API_KEY', defaultValue: 'No API key'),
            style: TextStyle(
              fontSize: 20
            )),
      ),
    );
  }
}
