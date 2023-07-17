import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';

class RootDetection extends StatefulWidget {
  const RootDetection({super.key});
  @override
  _RootDetectionState createState() => _RootDetectionState();
}

class _RootDetectionState extends State<RootDetection> {
  bool isJailBroken = false;
  bool isDeveloperMode = false;

  @override
  void initState() {
    super.initState();
    checkJailbreakStatus();
  }

  Future<void> checkJailbreakStatus() async {
    bool isJailBroken = await FlutterJailbreakDetection.jailbroken;
    bool isDeveloperMode = await FlutterJailbreakDetection.developerMode;
    setState(() {
      this.isJailBroken = isJailBroken;
      this.isDeveloperMode = isDeveloperMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Jailbreak Detection'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Is Root: $isJailBroken', style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 20),
              Text('Is DeveloperMode: $isDeveloperMode', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ),
    );
  }
}
