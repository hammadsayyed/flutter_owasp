import 'package:flutter/material.dart';
import 'package:flutter_owasp/constants.dart';

class ReverseEngineerKey extends StatefulWidget {
  const ReverseEngineerKey({Key? key}) : super(key: key);

  @override
  State<ReverseEngineerKey> createState() => _ReverseEngineerKeyState();
}

class _ReverseEngineerKeyState extends State<ReverseEngineerKey> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reverse Engineer Key Leak'),
      ),
      body: const Center(
        child: Text(Constants.API_KEY,
            style: TextStyle(
              fontSize: 20
            )),
      ),
    );
  }
}
